//
//  NetworkManager.swift
//  ToffeeHome
//
//  Created by Khaled on 13/8/23.
//

import Foundation
import Combine

protocol GenericAPIClient {
    func requestData<T: Decodable>(endpoint: Endpoint, method: HTTPMethod, body: Data?, queryParams: [String: String]?, type: T.Type, decoder: JSONDecoder) -> Future<T, Error>
    // MARK: - Implement func for upolading task & downloading task if needed
}

class NetworkManager: GenericAPIClient {
    static let shared = NetworkManager()
    private var cancellables = Set<AnyCancellable>()
    
    func requestData<T: Decodable>(
        endpoint: Endpoint,
        method: HTTPMethod = .get,
        body: Data? = nil,
        queryParams: [String: String]? = nil,
        type: T.Type,
        decoder: JSONDecoder = JSONDecoder()
    ) -> Future<T, Error> {
        return Future<T, Error> { [weak self] promise in
            guard let self = self, var components = URLComponents(string: Constants.ProductionServer.baseURL.appending(endpoint.rawValue)) else {
                return promise(.failure(NetworkError.invalidURL))
            }
            
            if let queryParams = queryParams {
                components.queryItems = queryParams.map { URLQueryItem(name: $0.key, value: $0.value) }
            }
            
            guard let url = components.url else {
                return promise(.failure(NetworkError.invalidURL))
            }
            
            var request = URLRequest(url: url)
            request.httpMethod = method.rawValue
            request.httpBody = body
            
            // Log Details
            print("\nRequest Details:")
            print("URL is \(url.absoluteString)")
            if let method = request.httpMethod {
                print("Request Method: \(method)")
            }
            print("Header:\n \(request.allHTTPHeaderFields ?? [:])")
            if let bodyData = body?.prettyPrintedJSONString {
                print("Body Data:\n \(bodyData)")
            }
            
            URLSession.shared.dataTaskPublisher(for: request)
                .tryMap { (data, response) -> Data in
                    guard let httpResponse = response as? HTTPURLResponse, 200...299 ~= httpResponse.statusCode else {
                        throw NetworkError.responseError
                    }
                    return data
                }
                .decode(type: T.self, decoder: decoder)
                .receive(on: RunLoop.main)
                .sink(receiveCompletion: { (completion) in
                    if case let .failure(error) = completion {
                        print("Error: \(error)")
                        switch error {
                        case let decodingError as DecodingError:
                            promise(.failure(decodingError))
                        case let apiError as NetworkError:
                            promise(.failure(apiError))
                        default:
                            promise(.failure(NetworkError.unknown))
                        }
                    }
                }, receiveValue: {
                    print("\nResponse Details:")
                    print($0)
                    promise(.success($0))
                })
                .store(in: &self.cancellables)
        }
    }
    private init() { }
}


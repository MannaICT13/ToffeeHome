//
//  CombineNetworkService.swift
//  ToffeeHome
//
//  Created by Khaled on 14/8/23.
//

import Foundation
import Combine

class HomeCombineNetworkService {
    static let shared = HomeCombineNetworkService()
    private var cancellables = Set<AnyCancellable>()
    
    func getPosts(success: @escaping (_ response: [Episode]?) -> Void,
                failure: @escaping ( _ error: String) -> Void) {
        
        NetworkManager.shared.requestData(endpoint: .episodes,
                                     method: .get,
                                     type: [Episode].self)
            .sink { completion in
                switch completion {
                case .failure(let error):
                    failure("error is \(error.localizedDescription)")
                case .finished:
                    print("Finished")
                }
            } receiveValue: { posts in
                success(posts)
            }
            .store(in: &cancellables)
    }
    
    // MARK: - Implement more func for different endpoints
    
    private init() { }
}


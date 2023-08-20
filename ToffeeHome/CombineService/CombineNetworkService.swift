//
//  CombineNetworkService.swift
//  ToffeeHome
//
//  Created by Khaled on 14/8/23.
//

import Foundation
import Combine

class HomeCombineNetworkService {
    private let networkManager: NetworkManager = .init()
    private var cancellables = Set<AnyCancellable>()
    
    func getPosts(success: @escaping (_ response: [Episode]?) -> Void,
                  failure: @escaping (_ error: String) -> Void) {
        
        networkManager.requestDataWithCaching(endpoint: .episodes,
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
}

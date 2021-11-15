//
//  NetworkManager.swift
//  SwiftUICombine
//
//  Created by Syed Najam on 14.11.21.
//

import Foundation
import Combine

class NetworkManager {
    
    static let shared = NetworkManager()
    private init() { }
    
    private var cancellables = Set<AnyCancellable>()
    
    func getRequest<T: Decodable>(method: String, id: Int? = nil, limit: Int, type: T.Type) -> Future<T, Error> {
        return Future<T, Error> { [weak self] promise in
            Connectivity().checkInternetConnection { isConnected in
                if(!isConnected){
                    return promise(.failure(NetworkError.NoInternet))
                }
            }
            
            
            guard let self = self, let url = URL(string: RestApiUrls.baseUrl.rawValue.appending(method).appending(id == nil ? "" : "/\(id ?? 0)").appending("?limit=\(String(limit))")) else {
                return promise(.failure(NetworkError.URLError))
            }
            
            URLSession.shared.dataTaskPublisher(for: url)
                .tryMap { (data, response) -> Data in
                    guard let httpResponse = response as? HTTPURLResponse,
                          (200...299).contains(httpResponse.statusCode) else {
                              throw NetworkError.responseError
                          }
                    return data
                }
                .decode(type: T.self, decoder: JSONDecoder())
                .receive(on: RunLoop.main)
                .sink(receiveCompletion: { (completion) in
                    if case let .failure(error) = completion {
                        switch error {
                        case let decodingError as DecodingError:
                            promise(.failure(decodingError))
                        case let networkError as NetworkError:
                            promise(.failure(networkError))
                        default:
                            promise(.failure(NetworkError.unknown))
                        }
                    }
                }, receiveValue: { value in promise(.success(value)) })
                .store(in: &self.cancellables)
        }
    }
}

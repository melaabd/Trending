//
//  APIManager.swift
//  Trending
//
//  Created by melaabd on 2/26/22.
//

import Foundation

enum NetworkError: Error {
    case invalidURL
    case badRequest
    case invalidData
    case decodingError
}

struct APIManager {
    
    var session: URLSession!
    let timeOut = 60.0
        
    init() {
        let configuration = URLSessionConfiguration.default
        configuration.timeoutIntervalForRequest = timeOut
        configuration.timeoutIntervalForResource = timeOut
        session = URLSession(configuration: configuration)
    }
    
    /// base codableTask with custom url and geniric model
    /// - Returns: URLSessionDataTask
    func codableTask<T: Codable>(with urlRequest: URLRequest, completion: @escaping (Result<T, NetworkError>) -> Void) -> URLSessionDataTask {
        session.dataTask(with: urlRequest) { data, response, error in
            
            guard error == nil else {
                completion(.failure(.badRequest))
                return
            }
            
            guard let data = data else {
                completion(.failure(.invalidData))
                return
            }
            
            do {
              let decodedResponse = try JSONDecoder().decode(T.self, from: data)
                completion(.success(decodedResponse))
            } catch {
                completion(.failure(.decodingError))
            }
            
        }
    }
}

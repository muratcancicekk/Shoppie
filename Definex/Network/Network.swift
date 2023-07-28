//
//  Network.swift
//  Definex
//
//  Created by Murat Çiçek on 27.07.2023.
//

import Foundation

class NetworkManager {
    static let shared = NetworkManager()

    func request<T: Codable,C:Codable>(with requestType: RequestType,
                                       model: T,
                                       completion: @escaping (Result<C, NetworkError>) -> Void) {
        
        guard let request = BaseRequest.requestGenerate(requestType: requestType, model: model) else {
            completion(.failure(.invalidRequest))
            return
        }
        
        let task = URLSessionCache.session().dataTask(with: request) { (data, response, error) in
            if let _ = error {
                completion(.failure(.requestFailed))
                return
            }
            
            if let httpResponse = response as? HTTPURLResponse {
                   if httpResponse.statusCode == 401 {
                       completion(.failure(.tokenError))
                       }
                   }

            guard let data = data else {
                completion(.failure(.invalidData))
                return
            }

            do {
                let decoder = JSONDecoder()
                let result = try decoder.decode(C.self, from: data)
                completion(.success(result))
            } catch {
                completion(.failure(.invalidData))
            }
        }

        task.resume()
    }
}

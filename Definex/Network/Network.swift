//
//  Network.swift
//  Definex
//
//  Created by Murat Çiçek on 27.07.2023.
//

import Foundation

final class NetworkManager {
    static let model : LoginModel.Request? = nil
    static let shared = NetworkManager()
    private let cache: URLCache
    private let session: URLSession

    private init() {
           self.cache = URLCache.shared
           
           let config = URLSessionConfiguration.default
           config.urlCache = cache
           config.requestCachePolicy = .returnCacheDataElseLoad
           self.session = URLSession(configuration: config)
       }
    
    /// Network Request
    /// - Parameters:
    ///   - requestType: We select the network url we will send from here
    ///   - model: We provide the Request model
    ///   - completion: We can do our operations according to the returned data here
    func request<T: Codable, C:Codable>(with requestType: RequestType,
                                        model: T? = model,
                                        completion: @escaping (Result<C, NetworkError>) -> Void) {
        guard let request = BaseRequest.requestGenerate(requestType: requestType, model: model) else {
            completion(.failure(.invalidRequest))
            return
        }
        
        if NetworkManager.isInternetAvailable() {
            let task = URLSessionCache.session().dataTask(with: request) { (data, response, error) in
                if let error = error {
                    completion(.failure(.requestFailed))
                    AlertManager.showAlert(title: "ERROR".localized(),
                                           message: error.localizedDescription,
                                           preferredStyle: .alert)
                    return
                }
                if let httpResponse = response as? HTTPURLResponse {
                    if httpResponse.statusCode == 401 {
                        AlertManager.showAlert(title: "ERROR".localized(),
                                               message: error?.localizedDescription,
                                               preferredStyle: .alert)
                        completion(.failure(.tokenError))
                    }
                }
                guard let data = data else {
                    AlertManager.showAlert(title: "ERROR".localized(),
                                           message: error?.localizedDescription,
                                           preferredStyle: .alert)
                    completion(.failure(.invalidData))
                    return
                }
                do {
                    let decoder = JSONDecoder()
                    let result = try decoder.decode(C.self, from: data)
                    completion(.success(result))
                } catch {
                    AlertManager.showAlert(title: "ERROR".localized(), message: error.localizedDescription, preferredStyle: .alert)
                    completion(.failure(.invalidData))
                }
            }
            task.resume()
        } else {
            if let cachedResponse = cache.cachedResponse(for: URLRequest(url: requestType.endPoint!)) {
                do {
                    let decoder = JSONDecoder()
                    let result = try decoder.decode(C.self, from: cachedResponse.data)
                    completion(.success(result))
                } catch {
                    AlertManager.showAlert(title: "ERROR".localized(), message: error.localizedDescription, preferredStyle: .alert)
                    completion(.failure(.invalidData))
                }
            }
                }
        }
    }

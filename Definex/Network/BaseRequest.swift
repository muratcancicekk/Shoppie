//
//  BaseRequest.swift
//  Definex
//
//  Created by Murat Çiçek on 27.07.2023.
//
import Foundation

final class BaseRequest {
    static func requestGenerate<T:Codable>(requestType: RequestType, model: T ) -> URLRequest? {
        guard let url = requestType.endPoint else {
            return nil
        }

        var request = URLRequest(url: url)
        request.httpMethod = requestType.httpMethod.rawValue
        if request.httpMethod == HttpMethod.POST.rawValue {
            if let modelData = try? JSONEncoder().encode(model) {
                request.httpBody = modelData
                request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            }
        }
        if let token = UserDefaultsOrganizer.token.read() {
            request.setValue(token, forHTTPHeaderField: "token")
        }
        return request
    }
}

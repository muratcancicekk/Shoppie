//
//  LoginModel.swift
//  Definex
//
//  Created by Murat Çiçek on 27.07.2023.
//

import Foundation

enum LoginModel {
    struct Request: Codable {
        let email: String?
        let password: String?
    }
    
    struct Response: Codable {
        let isSuccess: Bool?
        let message: String?
        let statusCode: Int?
        let token: String?
    }

}

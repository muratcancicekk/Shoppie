//
//  NetworkError.swift
//  Definex
//
//  Created by Murat Çiçek on 27.07.2023.
//

import Foundation

enum NetworkError: Error {
    case invalidRequest
    case requestFailed
    case invalidData
    case tokenError
    case noInternet
}

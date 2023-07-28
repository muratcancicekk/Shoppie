//
//  RequestType.swift
//  Definex
//
//  Created by Murat Çiçek on 27.07.2023.
//

import Foundation

enum RequestType {
    case login
    case discoverFirstHorizontalList
    case discoverSecondHorizontalList
    case discoverThirthTwoColumnList
    
    var endPoint : URL? {
        var components = URLComponents()
        components.scheme = URLConstants.scheme.rawValue
        components.host = URLConstants.host.rawValue
            
        switch self {
        case .login:
            components.path = EndPoints.login.rawValue
            return components.url
        case .discoverFirstHorizontalList:
            components.path = EndPoints.discoverFirstHorizontalList.rawValue
            return components.url
        case .discoverSecondHorizontalList:
            components.path = EndPoints.discoverSecondHorizontalList.rawValue
            return components.url
        case .discoverThirthTwoColumnList:
            components.path = EndPoints.discoverThirthTwoColumnList.rawValue
            return components.url
        }
    }
    
    var httpMethod : HttpMethod {
        switch self {
        case .login:
            return .POST
        default:
            return .GET
        }
    }
}



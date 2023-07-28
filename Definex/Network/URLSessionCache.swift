//
//  URLSessionCache.swift
//  Definex
//
//  Created by Murat Çiçek on 27.07.2023.
//

import Foundation

final class URLSessionCache  {
    
        static func session() ->  URLSession {
        
        let config = URLSessionConfiguration.default
         
        // TODO: Buradaki acıklamaları ingilizce yaz
        // URLCache oluşturma ve yapılandırma (Önbellek boyutu 10 MB olarak ayarlandı)
        let cacheSizeMemory = 10 * 1024 * 1024 // 10 MB
        let cacheSizeDisk = 100 * 1024 * 1024 // 100 MB
        let urlCache = URLCache(memoryCapacity: cacheSizeMemory, diskCapacity: cacheSizeDisk, diskPath: "myCache")
        config.urlCache = urlCache
        config.requestCachePolicy = .useProtocolCachePolicy
        
        // URLSession oluşturma
        return URLSession(configuration: config)
    }
}

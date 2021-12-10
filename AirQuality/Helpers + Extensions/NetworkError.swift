//
//  NetworkError.swift
//  AirQuality
//
//  Created by Ethan Perkins on 12/2/21.
//

import Foundation

enum NetworkError: LocalizedError {
    
    case invalidURL
    case thrownError(Error)
    case noData
    case unableToDecode
    
    var errorDescription: String? {
        switch self {
        
        case .invalidURL:
            return "The server failed to reach the url"
        case .thrownError(let error):
            return "Error: \(error.localizedDescription) -- \(error)"
        case .noData:
            return "The server responded with no data"
        case .unableToDecode:
            return "Unable to decode data"
        }
    }
    
    
    
}

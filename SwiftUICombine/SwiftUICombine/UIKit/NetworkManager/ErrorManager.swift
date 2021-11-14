//
//  Error.swift
//  SwiftUICombine
//
//  Created by Syed Najam on 14.11.21.
//

import Foundation

class ErrorManager {
    
    static let shared = ErrorManager()
    private init() { }
}

enum NetworkError: Error {
    case NoInternet
    case URLError
    case responseError
    case unknown
}

extension NetworkError: LocalizedError {
var errorDescription: String? {
    switch self {
    case .NoInternet:
        return NSLocalizedString("No internet connection", comment: "Check internet")
    case .URLError:
        return NSLocalizedString("Invalid URL", comment: "Invalid URL")
    case .responseError:
        return NSLocalizedString("Unexpected status code", comment: "Invalid response")
    case .unknown:
        return NSLocalizedString("Unknown error", comment: "Unknown error")
    }
}
}


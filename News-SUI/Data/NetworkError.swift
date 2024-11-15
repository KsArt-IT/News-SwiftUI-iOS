//
//  NetworkServiceError.swift
//  News-SUI
//
//  Created by KsArT on 15.11.2024.
//

import Foundation

enum NetworkError: Error {
    case cancelled
    case invalidRequest
    case invalidResponse(code: Int, message: String)
    case decodingError(DecodingError)
    case networkError(Error)
    
    // MARK: - Description
    var localizedDescription: String {
        switch self {
        case .invalidRequest:
            String(localized: "The request is invalid.")
        case .invalidResponse(let code, let message):
            String(localized: "The response is invalid, code") + ": \(code).\n\(message)"
        case .decodingError(let error):
            String(localized: "Decoding failed with error") + ": \(error.localizedDescription)."
        case .networkError(let error):
            String(localized: "Network error occurred") + ": \(error.localizedDescription)."
        case .cancelled:
            ""
        }
    }
}

//
//  NewsEndpoint.swift
//  News-SUI
//
//  Created by KsArT on 15.11.2024.
//

import Foundation

enum NewsEndpoint {
    case top(language: String, page: Int)
    case all(language: String, page: Int)
    case news(id: String)
}

extension NewsEndpoint {
    var request: URLRequest? {
        guard let url = self.url else { return nil }
        
        var request = URLRequest(url: url)
        request.httpMethod = method
        request.timeoutInterval = 60
        request.allHTTPHeaderFields = [
            "accept": "application/json",
        ]
        
        return request
    }
    
    private var url: URL? {
        switch self {
        case let .top(language, page):
            getUrl(
                path: "/top",
                query: [
                    Self.languageParam: language,
                    Self.pageParam: "\(page)",
                ]
            )
        case let .all(language, page):
            getUrl(
                path: "/all",
                query: [
                    Self.languageParam: language,
                    Self.pageParam: "\(page)",
                ]
            )
        case let .news(id):
            getUrl(
                path: "/uuid/\(id)"
            )
        }
    }
    
    private var method: String {
        switch self {
        case .top, .all, .news:
            return "GET"
        }
    }
    
    private func getUrl(url: String = Self.baseURL, path: String, query params: [String: String] = [:]) -> URL? {
        guard var components = URLComponents(string: url) else { return nil }
        
        components.path += path
        
        let queryItems = [getQueryItem(key: Self.apiKeyParam, value: Self.apiKey)]
        components.queryItems = queryItems + params.map(getQueryItem)
        
        return components.url
    }
    
    private func getQueryItem(key: String, value: String) -> URLQueryItem {
        URLQueryItem(name: key, value: value)
    }
    
}

extension NewsEndpoint {
    static var pageStart = 1
    
    // URL
    private static let baseURL = "https://api.thenewsapi.com/v1/news"
    
    // Query params
    private static let apiKeyParam = "api_token"
    private static let languageParam = "language"
    private static let pageParam = "page"
    
    // api key
    static let apiKey = Bundle.main.object(forInfoDictionaryKey: "API_KEY") as? String ?? "Please add your api key to the project"
    
}

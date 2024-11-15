//
//  Welcome.swift
//  News-SUI
//
//  Created by KsArT on 15.11.2024.
//

import Foundation

// MARK: - Welcome
struct NewsResponse: Decodable {
    let warnings: [String]
    let meta: Meta
    let data: [NewsDataDto]
}

// MARK: - Datum
struct NewsDataDto: Decodable {
    let uuid: String
    let title: String
    let description: String
    let keywords: String
    let snippet: String
    let url: String
    let imageURL: String
    let language: String
    let publishedAt: String
    let source: String
    let categories: [String]
    let relevanceScore: String?
    let locale: String
}

// MARK: - Meta
struct Meta: Decodable {
    let found, returned, limit, page: Int
}

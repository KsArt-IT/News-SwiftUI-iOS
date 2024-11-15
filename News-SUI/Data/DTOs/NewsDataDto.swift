//
//  NewsDataDto.swift
//  News-SUI
//
//  Created by KsArT on 15.11.2024.
//

import Foundation

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

extension NewsDataDto {
    
    func mapToDomain(data: Data? = nil) -> NewsData {
        NewsData(
            uuid: self.uuid,
            title: self.title,
            description: self.description,
            keywords: self.keywords,
            snippet: self.snippet,
            url: self.url,
            image: data,
            language: self.language,
            publishedAt: self.publishedAt,
            source: self.source,
            categories: self.categories,
            relevanceScore: self.relevanceScore ?? "",
            locale: self.locale
        )
    }
}

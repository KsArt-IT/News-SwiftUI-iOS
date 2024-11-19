//
//  NewsDataDto.swift
//  News-SUI
//
//  Created by KsArT on 15.11.2024.
//

import Foundation

struct NewsData: Identifiable, Decodable {
    let id: String
    let title: String
    let description: String
    let keywords: String
    let snippet: String
    let url: String
    let imageUrl: String
    let image: Data?
    let language: String
    let publishedAt: String
    let source: String
    let categories: [String]
    let locale: String
}

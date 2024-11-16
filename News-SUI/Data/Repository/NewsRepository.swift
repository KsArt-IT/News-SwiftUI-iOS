//
//  NewsRepository.swift
//  News-SUI
//
//  Created by KsArT on 15.11.2024.
//

import Foundation

protocol NewsRepository: AnyObject {
    func fetchTopNews(locale: String, language: String, page: Int) async -> Result<[NewsData], any Error>
    func fetchAllNews(locale: String, language: String, page: Int) async -> Result<[NewsData], any Error>
    func fetchNews(id: String) async -> Result<NewsData, any Error>
}

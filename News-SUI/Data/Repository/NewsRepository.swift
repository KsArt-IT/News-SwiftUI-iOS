//
//  NewsRepository.swift
//  News-SUI
//
//  Created by KsArT on 15.11.2024.
//

import Foundation

protocol NewsRepository: AnyObject {
    func fetchTopNews(language: String, page: Int) async -> Result<[NewsData], any Error>
    func fetchAllNews(language: String, page: Int) async -> Result<[NewsData], any Error>
    func fetchNews(id: String) async -> Result<NewsData, any Error>
}

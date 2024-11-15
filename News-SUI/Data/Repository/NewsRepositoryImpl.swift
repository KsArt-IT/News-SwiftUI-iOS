//
//  NewsRepositoryImpl.swift
//  News-SUI
//
//  Created by KsArT on 15.11.2024.
//

import Foundation

final class NewsRepositoryImpl: NewsRepository {

    private let service: NewsService
    
    init(service: NewsService) {
        self.service = service
    }
    
    func fetchTopNews(language: String, page: Int) async -> Result<[NewsData], any Error> {
        await fetchData(endpoint: .top(language: language, page: page))
    }
    
    func fetchAllNews(language: String, page: Int) async -> Result<[NewsData], any Error> {
        await fetchData(endpoint: .all(language: language, page: page))
    }
    
    private func fetchData(endpoint: NewsEndpoint) async -> Result<[NewsData], any Error> {
        let result: Result<[NewsDataDto], any Error> = await service.fetchData(endpoint: endpoint)
        switch result {
        case .success(let news):
            var newsWithImage: [NewsData] = []
            for entity in news {
                let imageData = await service.fetchData(url: entity.imageURL)
                newsWithImage.append(entity.mapToDomain(data: imageData))
            }
            return .success(newsWithImage)
        case .failure(let error):
            return .failure(error)
        }
    }

    func fetchNews(id: String) async -> Result<NewsData, any Error> {
        let result: Result<NewsDataDto, any Error> = await service.fetchData(endpoint: .news(id: id))
        switch result {
        case .success(let news):
            let imageData = await service.fetchData(url: news.imageURL)
            return .success(news.mapToDomain(data: imageData))
        case .failure(let error):
            return .failure(error)
        }
    }
    
    private func fetchImage(from url: String) async -> Data? {
        await service.fetchData(url: url)
    }
}

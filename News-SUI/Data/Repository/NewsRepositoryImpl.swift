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
    
    func fetchTopNews(locale: String, language: String, page: Int) async -> Result<[NewsData], any Error> {
        await fetchData(endpoint: .top(locale: locale, language: language, page: page))
    }
    
    func fetchAllNews(locale: String, language: String, page: Int) async -> Result<[NewsData], any Error> {
        await fetchData(endpoint: .all(language: language, page: page))
    }
    
    private func fetchData(endpoint: NewsEndpoint) async -> Result<[NewsData], any Error> {
        let result: Result<[NewsDataDto], any Error> = await service.fetchData(endpoint: endpoint)
        switch result {
        case .success(let news):
            // TODO: переделать дозагрузку картинок
//            var newsWithImage: [NewsData] = []
//            for entity in news {
//                let imageData = await service.fetchData(url: entity.imageUrl)
//                newsWithImage.append(entity.mapToDomain(data: imageData))
//            }
//            return .success(newsWithImage)
            return .success(news.map { $0.mapToDomain() })
        case .failure(let error):
            return .failure(error)
        }
    }

    func fetchNews(id: String) async -> Result<NewsData, any Error> {
        let result: Result<NewsDataDto, any Error> = await service.fetchData(endpoint: .news(id: id))
        switch result {
        case .success(let news):
            let imageData = await service.fetchData(url: news.imageUrl)
            return .success(news.mapToDomain(data: imageData))
        case .failure(let error):
            return .failure(error)
        }
    }
}

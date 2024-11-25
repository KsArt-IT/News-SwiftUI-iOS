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
    
    func fetchTopNewsCount(locale: String, language: String) async -> Int? {
        await service.fetchDataCount(endpoint: .top(locale: locale, language: language, page: NewsEndpoint.pageStart))
    }
    
    func fetchAllNewsCount(locale: String, language: String) async -> Int? {
        await service.fetchDataCount(endpoint: .all(language: language, page: NewsEndpoint.pageStart))
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
            return .success(await loadImageAndToDomain(news))
        case .failure(let error):
            return .failure(error)
        }
    }
    
    private func loadImageAndToDomain(_ list: [NewsDataDto]) async -> [NewsData] {
        guard !list.isEmpty else { return [] }
        
        var result: [NewsData] = []
        // Создаем массив асинхронных задач для загрузки изображений
        let tasks = list.map { item in
            Task {
                let imageData = await service.fetchData(url: item.imageUrl)
                return item.mapToDomain(data: imageData)
            }
        }
        // Ждем выполнения всех задач и возвращаем результат
        for task in tasks {
            result.append(await task.value)
        }
        return result
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

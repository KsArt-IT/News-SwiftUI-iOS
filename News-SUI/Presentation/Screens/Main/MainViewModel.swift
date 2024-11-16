//
//  MainViewModel.swift
//  News-SUI
//
//  Created by KsArT on 16.11.2024.
//

import Foundation

final class MainViewModel: ObservableObject {
    
    private let repository: NewsRepository
    
    @Published var topNews: [NewsData] = []
    @Published var errorTopNews: String?
    private var pageTopNews = 1
    private var taskTopNews: Task<Void, Never>?
    
    @Published var allNews: [NewsData] = []
    @Published var errorAllNews: String?
    private var pageAllNews = 1
    private var taskAllNews: Task<Void, Never>?
    
    @Published var languageNews: String = String(localized: "language")
    @Published var localeNews: String = String(localized: "locale")
    
    init(repository: NewsRepository) {
        self.repository = repository
        
        Task {
            await fetchNews()
        }
    }
    
    // MARK: - Loading news
    private func fetchNews() async {
        async let listTopNews = self.fetchTopNews()
        async let listAllNews = self.fetchAllNews()
        
        await self.setNews(top: await listTopNews, all: await listAllNews)
    }
    
    private func fetchTopNews() async -> [NewsData]? {
        let result = await self.repository.fetchTopNews(
            locale: self.localeNews,
            language: self.languageNews,
            page: self.pageTopNews
        )
        switch result {
        case .success(let news):
            pageTopNews += 1
            return news
        case .failure(let error):
            await self.showErrorTopNews(error)
        }
        return nil
    }
    
    private func fetchAllNews() async -> [NewsData]? {
        let result = await self.repository.fetchAllNews(
            locale: self.localeNews,
            language: self.languageNews,
            page: self.pageAllNews
        )
        switch result {
        case .success(let news):
            pageAllNews += 1
            return news
        case .failure(let error):
            await self.showErrorAllNews(error)
        }
        return nil
    }
    
    public func fetchTopNews() {
        taskTopNews?.cancel()
        
        taskTopNews = Task { [weak self] in
            guard let self else { return }
            
            let result = await self.repository.fetchTopNews(
                locale: self.localeNews,
                language: self.languageNews,
                page: self.pageTopNews
            )
            switch result {
            case .success(let news):
                pageTopNews += 1
                await self.addTopNews(news)
            case .failure(let error):
                await self.showErrorTopNews(error)
            }
        }
    }
    
    public func fetchAllNews() {
        taskTopNews?.cancel()
        
        taskTopNews = Task { [weak self] in
            guard let self else { return }
            
            let result = await self.repository.fetchAllNews(
                locale: self.localeNews,
                language: self.languageNews,
                page: self.pageAllNews
            )
            switch result {
            case .success(let news):
                pageAllNews += 1
                await self.addAllNews(news)
            case .failure(let error):
                await self.showErrorAllNews(error)
            }
        }
    }
    
    // MARK: - Show errors
    @MainActor
    private func showErrorTopNews(_ error: Error) async {
        if let error = error as? NetworkError {
            print("MainViewModel: \(#function) error: \(error.localizedDescription)")
            errorTopNews = error.localizedDescription
        } else {
            print("MainViewModel: \(#function) error: \(error.localizedDescription)")
            errorTopNews = error.localizedDescription
        }
    }
    
    @MainActor
    private func showErrorAllNews(_ error: Error) async {
        if let error = error as? NetworkError {
            print("MainViewModel: \(#function) error: \(error.localizedDescription)")
            errorAllNews = error.localizedDescription
        } else {
            print("MainViewModel: \(#function) error: \(error.localizedDescription)")
            errorAllNews = error.localizedDescription
        }
    }
    
    // MARK: - Add list to news
    @MainActor
    private func setNews(top listTop: [NewsData]?, all listAll: [NewsData]?) async {
        self.topNews = listTop ?? []
        self.allNews = listAll ?? []
    }
    
    @MainActor
    private func addTopNews(_ list: [NewsData]) async {
        self.topNews += list
    }
    
    @MainActor
    private func addAllNews(_ list: [NewsData]) async {
        self.allNews += list
    }
}

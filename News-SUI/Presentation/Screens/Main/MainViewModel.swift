//
//  MainViewModel.swift
//  News-SUI
//
//  Created by KsArT on 16.11.2024.
//

import Foundation

final class MainViewModel: ObservableObject {
    
    private let repository: NewsRepository
    
    @Published var isLoading = false
    @Published var isSplashVisible = true
    
    @Published var topNews: [NewsData] = []
    @Published var errorTopNews: String?
    @Published var topNewsState: ReloadingState = .none
    private var pageTopNews = 1
    private var countTopNews: Int = 10000
    private var isMoreTopNews: Bool {
        countTopNews > topNews.count
    }
    private var taskTopNews: Task<Void, Never>?
    
    @Published var allNews: [NewsData] = []
    @Published var errorAllNews: String?
    @Published var allNewsState: ReloadingState = .none
    private var pageAllNews = 1
    private var countAllNews: Int = 10000
    private var isMoreAllNews: Bool {
        countAllNews > allNews.count
    }
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
    // первая загрузка новостей, загрузим количество
    private func fetchNews() async {
        await showLoader()
        
        // загрузим количество
        self.countTopNews = await self.repository.fetchTopNewsCount(
            locale: self.localeNews,
            language: self.languageNews
        ) ?? countTopNews
        self.countAllNews = await self.repository.fetchAllNewsCount(
            locale: self.localeNews,
            language: self.languageNews
        ) ?? countAllNews

        async let listTopNews = self.fetchTopNews()
        async let listAllNews = self.fetchAllNews()
        
        await self.setNews(top: await listTopNews, all: await listAllNews)
        
        await showLoader(false)
        // установим состояние дозагрузки
        if self.topNewsState == .none {
            await self.setTopNewsState(.reload)
        }
        if self.allNewsState == .none {
            await self.setAllNewsState(.reload)
        }
    }
    
    private func fetchTopNews() async -> [NewsData]? {
        let result = await self.repository.fetchTopNews(
            locale: self.localeNews,
            language: self.languageNews,
            page: self.pageTopNews
        )
        switch result {
        case .success(let news):
            self.pageTopNews += 1
            return news
        case .failure(let error):
            await self.setTopNewsState(.error(message: self.getErrorMessage(error)))
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
            await self.setAllNewsState(.error(message: self.getErrorMessage(error)))
        }
        return nil
    }
    
    // MARK: - Loading more news
    public func loadMoreTopNews() {
        print("MainViewModel: \(#function)")
        fetchTopNews()
    }
    
    public func loadMoreAllNews() {
        print("MainViewModel: \(#function)")
        fetchAllNews()
    }
    
    public func fetchTopNews() {
        taskTopNews?.cancel()
        
        taskTopNews = Task { [weak self] in
            guard let self else { return }
            
            await self.setTopNewsState(.loading)
            let result = await self.repository.fetchTopNews(
                locale: self.localeNews,
                language: self.languageNews,
                page: self.pageTopNews
            )
            switch result {
            case .success(let news):
                pageTopNews += 1
                await self.addTopNews(news)
                await self.setTopNewsState(.reload)
            case .failure(let error):
                await self.setTopNewsState(.error(message: self.getErrorMessage(error)))
            }
        }
    }
    
    public func fetchAllNews() {
        taskAllNews?.cancel()
        
        taskAllNews = Task { [weak self] in
            guard let self else { return }
            
            await self.setAllNewsState(.loading)
            let result = await self.repository.fetchAllNews(
                locale: self.localeNews,
                language: self.languageNews,
                page: self.pageAllNews
            )
            switch result {
            case .success(let news):
                pageAllNews += 1
                await self.addAllNews(news)
                await self.setAllNewsState(.reload)
            case .failure(let error):
                await self.setAllNewsState(.error(message: self.getErrorMessage(error)))
            }
        }
    }
    
    // MARK: - Show errors
    private func getErrorMessage(_ error: Error) -> String {
        if let error = error as? NetworkError {
            error.localizedDescription
        } else {
            error.localizedDescription
        }
    }
    
    // MARK: - Add list to news
    @MainActor
    private func setNews(top listTop: [NewsData]?, all listAll: [NewsData]?) async {
        self.topNews = listTop ?? []
        self.allNews = listAll ?? []
        // спрячем
        self.isSplashVisible = false
    }
    
    @MainActor
    private func addTopNews(_ list: [NewsData]) async {
        self.topNews = Set(self.topNews + list).sorted(by: { $0.publishedAt > $1.publishedAt })
    }
    
    @MainActor
    private func addAllNews(_ list: [NewsData]) async {
        self.allNews = Set(self.allNews + list).sorted(by: { $0.publishedAt > $1.publishedAt })
    }
    
    // MARK: - Loading
    @MainActor
    private func showLoader(_ show: Bool = true) {
        self.isLoading = show
    }
    
    @MainActor
    private func setTopNewsState(_ state: ReloadingState) {
        self.topNewsState = if case .reload = state, !isMoreTopNews {
            .none
        } else {
            state
        }
    }

    @MainActor
    private func setAllNewsState(_ state: ReloadingState) {
        self.allNewsState = if case .reload = state, !isMoreAllNews {
            .none
        } else {
            state
        }
    }

}

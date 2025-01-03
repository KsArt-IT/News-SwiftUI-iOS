//
//  DIManager.swift
//  News-SUI
//
//  Created by KsArT on 16.11.2024.
//

import Foundation
import Swinject

final class DIManager {
    private let container = Container()
    
    // MARK: - Registering dependencies
    init() {
        registerRepository()
        registerMainViewModel()
    }
    
    private func registerRepository() {
        container.register(NewsService.self) { _ in
            NewsServiceImpl()
        }.inObjectScope(.weak)
        
        container.register(NewsRepository.self) { c in
            NewsRepositoryImpl(service: c.resolve(NewsService.self)!)
        }.inObjectScope(.container)
    }
    
    private func registerMainViewModel() {
        container.register(MainViewModel.self) { c in
            MainViewModel(repository: c.resolve(NewsRepository.self)!)
        }.inObjectScope(.weak)
    }
    
    // MARK: - Getting dependencies
    public func resolve<T>() -> T {
        resolve(T.self)!
    }
    
    public func resolve<T>(_ type: T.Type) -> T? {
        container.resolve(type)
    }
}

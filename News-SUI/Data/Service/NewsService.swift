//
//  NewsService.swift
//  News-SUI
//
//  Created by KsArT on 15.11.2024.
//

import Foundation

protocol NewsService: AnyObject {
    func fetchData<T>(endpoint: NewsEndpoint) async -> Result<T, any Error> where T: Decodable
    func fetchDataCount(endpoint: NewsEndpoint) async -> Int?
    func fetchData(url: String) async -> Data?
}

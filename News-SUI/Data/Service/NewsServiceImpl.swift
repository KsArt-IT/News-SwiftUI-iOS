//
//  NewsServiceImpl.swift
//  News-SUI
//
//  Created by KsArT on 15.11.2024.
//

import Foundation

final class NewsServiceImpl: NewsService {
    
    private lazy var session = URLSession.shared
    private lazy var decoder: JSONDecoder = {
        var decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }()
    
    // MARK: - Getting data from the network
    func fetchData<T>(endpoint: NewsEndpoint) async -> Result<T, any Error> where T : Decodable {
        guard let request = endpoint.request else { return .failure(NetworkError.invalidRequest) }
        
        do {
            let data = try await fetchData(for: request)
            let result: T = try decode(data)
            
            return .success(result)
        } catch let error as NetworkError {
            return .failure(error)
        } catch let error as DecodingError {
            return .failure(NetworkError.decodingError(error))
        } catch let error as URLError where error.code == .cancelled {
            return .failure(NetworkError.cancelled)
        } catch {
            print("NewsServiceImpl: \(error)")
            return .failure(NetworkError.networkError(error))
        }
    }
    
    func fetchData(url: String) async -> Data? {
        guard let url = URL(string: url) else { return nil }
        
        do {
            let request = URLRequest(url: url)
            let data = try await fetchData(for: request)
            
            return data
        } catch {
            print("NewsServiceImpl: error=\(error.localizedDescription)")
            return nil
        }
    }
    
    // MARK: - URLRequest
    private func fetchData(for reques: URLRequest) async throws -> Data {
        let (data, response) = try await session.data(for: reques)
        if let code = getErrorCode(for: response) {
            try getErrorMsg(code, from: data)
        }
        return data
    }
    
    // MARK: - Error handling
    private func getErrorCode(for response: URLResponse) -> Int? {
        guard let httpResponse = response as? HTTPURLResponse else { return -1 }
        
        return 200...299 ~= httpResponse.statusCode ? nil : httpResponse.statusCode
    }
    
    private func getErrorMsg(_ code: Int, from data: Data) throws {
        let message = if let response: NewsResponseErrors = try? decode(data) {
            "\(response.error.code)-\(response.error.message)"
        } else {
            ""
        }
        throw NetworkError.invalidResponse(code: code, message: message)
    }
    
    // MARK: - Decode data
    private func decode<T>(_ data: Data) throws -> T where T: Decodable {
        try decoder.decode(T.self, from: data)
    }
    
}

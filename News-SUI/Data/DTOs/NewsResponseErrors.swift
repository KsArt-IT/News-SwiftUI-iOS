//
//  Welcome 2.swift
//  News-SUI
//
//  Created by KsArT on 15.11.2024.
//

import Foundation

struct NewsResponseErrors: Decodable {
    let error: NewsError
}

struct NewsError: Decodable {
    let code: String
    let message: String
}

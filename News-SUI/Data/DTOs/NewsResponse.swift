//
//  Welcome.swift
//  News-SUI
//
//  Created by KsArT on 15.11.2024.
//

import Foundation

struct NewsResponse: Decodable {
    let warnings: [String]? // иногда появляется
    let meta: Meta
    let data: [NewsDataDto]
}

struct Meta: Decodable {
    let found, returned, limit, page: Int
}

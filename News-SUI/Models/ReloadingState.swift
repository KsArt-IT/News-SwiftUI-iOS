//
//  PaginationState.swift
//  News-SUI
//
//  Created by KsArT on 21.11.2024.
//

import Foundation

enum ReloadingState: Equatable {
    case none
    case reload
    case loading
    case error(message: String)
}

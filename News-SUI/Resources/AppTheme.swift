//
//  AppTheme.swift
//  News-SUI
//
//  Created by KsArT on 22.11.2024.
//

import SwiftUICore

enum AppTheme: Int, Hashable {
    case device
    case light
    case dark
}

extension AppTheme {
    // заполним при запуске
    static var deviceTheme: ColorScheme?
    
    var scheme: ColorScheme {
        switch self {
        case .device:
            Self.deviceTheme ?? .light
        case .light:
                .light
        case .dark:
                .dark
        }
    }
}

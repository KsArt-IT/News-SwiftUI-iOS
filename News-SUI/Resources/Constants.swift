//
//  Constants.swift
//  News-SUI
//
//  Created by KsArT on 19.11.2024.
//

import UIKit

enum Constants {
    // Название приложения из Bundle
    static let appName: String = {
        Bundle.main.object(forInfoDictionaryKey: "CFBundleDisplayName") as? String ??
        Bundle.main.object(forInfoDictionaryKey: "CFBundleName") as? String ?? "News"
    }()

    static let small: CGFloat = 8
    static let medium: CGFloat = 16
    
    static let frameV: CGFloat = 240
    static let frameVh: CGFloat = frameV + small * 4
    static let frameVi: CGFloat = frameV / 2
    
    static let frameH: CGFloat = 140
    static let frameHw: CGFloat = frameH / 1.5
    
    static let shadowRadius: CGFloat = 4
    
    static let cornerRadius: CGFloat = 8
    static let cornerSize = CGSize(width: 8, height: 8)
    
    static var photoHeight: CGFloat {
        UIScreen.main.bounds.height / 2
    }
    
    static var screenWidth: CGFloat {
        UIScreen.main.bounds.width
    }
}

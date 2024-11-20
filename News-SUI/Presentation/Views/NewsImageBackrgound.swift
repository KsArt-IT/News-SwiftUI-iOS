//
//  NewsImageBackrgound.swift
//  News-SUI
//
//  Created by KsArT on 20.11.2024.
//

import SwiftUI

struct NewsImageBackrgound: View {
    var body: some View {
        GeometryReader { _ in
            LinearGradient(
                colors: [Color(UIColor.systemBackground), .clear],
                startPoint: .bottom,
                endPoint: .top
            )
            .frame(height: Constants.photoHeight / 4)
            .offset(y: -Constants.photoHeight / 4)
        }
    }
}

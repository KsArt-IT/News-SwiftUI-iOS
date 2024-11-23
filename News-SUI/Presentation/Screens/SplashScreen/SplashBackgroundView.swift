//
//  SplashBackgroundView.swift
//  News-SUI
//
//  Created by KsArT on 23.11.2024.
//

import SwiftUI

struct SplashBackgroundView: View {
    var body: some View {
        LinearGradient(
            gradient: Gradient(colors: [Color.blue.opacity(0.3), Color.blue]),
            startPoint: .top,
            endPoint: .bottom
        )
        .ignoresSafeArea()
    }
}

#Preview {
    SplashBackgroundView()
}

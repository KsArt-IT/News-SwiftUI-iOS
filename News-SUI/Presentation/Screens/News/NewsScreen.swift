//
//  NewsScreen.swift
//  News-SUI
//
//  Created by KsArT on 18.11.2024.
//

import SwiftUI

struct NewsScreen: View {
    let article: NewsData
    
    var body: some View {
        Text(article.title)
    }
}

#Preview {
    NewsScreen(article: AllNewsPreview.news[0])
}

//
//  NewsListVView.swift
//  News-SUI
//
//  Created by KsArT on 18.11.2024.
//

import SwiftUI

struct NewsListVView<Content: View>: View {
    @Binding var list: [NewsData]
    @Binding var selected: NewsData?
    @ViewBuilder let reloadView: () -> Content
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            LazyVStack(spacing: 12) {
                ForEach(list) { article in
                    NewsItemHView(article: article)
                        .onTapGesture {
                            print("NewsListVView: select=\(article.id)")
                            selected = article
                        }
                }
                // отобразим дозагрузку
                reloadView()
            }
            .padding(.top, Constants.small)
        }
    }
}

#Preview {
    VStack {
        NewsListVView(list: .constant(AllNewsPreview.news), selected: .constant(nil)) {}
        Spacer()
    }
    .background(.secondary.opacity(0.3))
}

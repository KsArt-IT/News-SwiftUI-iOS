//
//  NewsListHView.swift
//  News-SUI
//
//  Created by KsArT on 18.11.2024.
//

import SwiftUI

struct NewsListHView: View {
    @Binding var list: [NewsData]
    @Binding var selected: NewsData?
    let reloading: () -> Void
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHStack(spacing: 12) {
                ForEach(list) { article in
                    NewsItemVView(article: article)
                        .onTapGesture {
                            print("NewsListHView: select=\(article.id)")
                            selected = article
                        }
                }
                Color.clear
                    .onAppear {
                        reloading()
                    }
            }
            .padding(.leading, Constants.small)
        }
        .frame(height: Constants.frameV)
    }
}

#Preview {
    VStack {
        NewsListHView(list: .constant(TopNewsPreview.news), selected: .constant(nil)) {}
        Spacer()
    }
    .background(.secondary.opacity(0.3))
}

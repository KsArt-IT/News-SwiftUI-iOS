//
//  NewsListVView.swift
//  News-SUI
//
//  Created by KsArT on 18.11.2024.
//

import SwiftUI

struct NewsListVView: View {
    @Binding var list: [NewsData]
    @Binding var selected: NewsData?
    let reloading: () -> Void
    
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
                Color.clear
                    .onAppear {
                        reloading()
                    }
            }
            .padding(.top, Constants.small)
        }
    }
}

#Preview {
    NewsListVView(list: .constant(AllNewsPreview.news), selected: .constant(nil)) {}
}

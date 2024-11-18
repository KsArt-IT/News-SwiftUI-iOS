//
//  TopNewsList 2.swift
//  News-SUI
//
//  Created by KsArT on 18.11.2024.
//

import SwiftUI

struct AllNewsList: View {
    @Binding var list: [NewsData]
    @Binding var selected: NewsData?
    let reloading: () -> Void
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            LazyVStack(spacing: 8) {
                ForEach(list) { article in
                    NewsItemView(article: article)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .frame(height: 100)
                        .background(.white)
                        .shadow(radius: 5)
                        .padding()
                        .onTapGesture {
                            selected = article
                        }
                }
                Color.clear
                    .onAppear {
                        reloading()
                    }
            }
        }
    }
}

#Preview {
    TopNewsList(list: .constant(MainViewModelPreview.shared.allNews), selected: .constant(nil)) {}
}

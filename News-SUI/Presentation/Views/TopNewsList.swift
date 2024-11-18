//
//  NewsList.swift
//  News-SUI
//
//  Created by KsArT on 18.11.2024.
//

import SwiftUI

struct TopNewsList: View {
    @Binding var list: [NewsData]
    @Binding var selected: NewsData?
    let reloading: () -> Void
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHStack(spacing: 8) {
                ForEach(list) { article in
                    NewsItemView(article: article)
                        .padding()
                        .frame(width: 200, height: 200)
                        .background(.white)
                        .shadow(radius: 5)
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
        .frame(height: 200)
    }
}

#Preview {
    TopNewsList(list: .constant(MainViewModelPreview.shared.topNews), selected: .constant(nil)) {}
}

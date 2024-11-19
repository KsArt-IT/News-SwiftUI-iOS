//
//  NewsItemVView.swift
//  News-SUI
//
//  Created by KsArT on 18.11.2024.
//

import SwiftUI

struct NewsItemVView: View {
    let article: NewsData
    
    var body: some View {
        VStack(alignment: .leading) {
            NewsImageView(data: article.image)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .clipShape(RoundedRectangle(cornerSize: Constants.cornerSize))
            Text(article.title)
                .font(.title3)
            Text(article.description)
            Spacer()
            Text(article.publishedAt)
        }
        .font(.caption)
        .lineLimit(2)
        .multilineTextAlignment(.leading)
        .frame(width: Constants.frameV)
        .padding(Constants.small)
        .background(.background)
        .clipShape(RoundedRectangle(cornerSize: Constants.cornerSize))
        .shadow(radius: Constants.shadowRadius)
    }
}

#Preview {
    NewsItemVView(article: AllNewsPreview.news[1])
}

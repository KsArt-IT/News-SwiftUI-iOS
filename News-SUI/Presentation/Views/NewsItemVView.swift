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
                .frame(maxWidth: .infinity, maxHeight: Constants.frameVi)
                .clipShape(RoundedRectangle(cornerSize: Constants.cornerSize))
            Text(article.title)
                .font(.title3)
            Text(article.description)
            Spacer()
            Text(article.publishedAt.toString())
        }
        .font(.caption)
        .lineLimit(2)
        .multilineTextAlignment(.leading)
        .frame(width: Constants.frameV, height: Constants.frameV)
        .padding(Constants.small)
        .background(.backgroundNews)
        .clipShape(RoundedRectangle(cornerSize: Constants.cornerSize))
        .shadow(radius: Constants.shadowRadius, x: Constants.shadowOffset, y: Constants.shadowOffset)
    }
}

#Preview {
    NewsItemVView(article: AllNewsPreview.news[1])
}

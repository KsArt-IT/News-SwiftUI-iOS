//
//  NewsItemHView.swift
//  News-SUI
//
//  Created by KsArT on 18.11.2024.
//


import SwiftUI

struct NewsItemHView: View {
    let article: NewsData
    
    var body: some View {
        HStack(alignment: .top) {
            NewsImageView(data: article.image)
                .frame(maxWidth: Constants.frameHw, maxHeight: .infinity)
                .clipShape(RoundedRectangle(cornerSize: Constants.cornerSize))
                .padding(Constants.small)
            VStack(alignment: .leading) {
                Text(article.title)
                    .font(.title3)
                Text(article.description)
                Spacer()
                Text(article.publishedAt.toString())
            }
            .font(.caption)
            .lineLimit(2)
            .multilineTextAlignment(.leading)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.vertical, Constants.small)
            .padding(.trailing, Constants.small)
        }
        .frame(maxWidth: .infinity)
        .frame(height: Constants.frameH)
        .background(.background)
        .clipShape(RoundedRectangle(cornerSize: Constants.cornerSize))
        .shadow(radius: Constants.shadowRadius)
        .padding(.horizontal, Constants.small)
    }
}

#Preview {
    NewsItemHView(article: AllNewsPreview.news[1])
}

//
//  NewsScreen.swift
//  News-SUI
//
//  Created by KsArT on 18.11.2024.
//

import SwiftUI

struct NewsScreen: View {
    @Environment(\.dismiss) var dismiss
    
    let article: NewsData
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            ScrollView(.vertical, showsIndicators: false) {
                NewsImageGeometryView(data: article.image)
                VStack(alignment: .leading, spacing: Constants.medium) {
                    Text(article.publishedAt.toString())
                        .font(.caption2)
                    Text(article.title)
                        .font(.title)
                        .multilineTextAlignment(.center)
                        .frame(maxWidth: .infinity)
                    Text(article.description.isEmpty ? article.snippet : article.description)
                        .font(.subheadline)
                    Spacer()
                    LabeledContent {
                        Link(destination: URL(string: article.url)!) {
                            HStack {
                                Image(systemName: "link.circle")
                                Text(article.source)
                            }
                            .font(.headline)
                            .underline()
                            .foregroundColor(.blue)
                        }
                    } label: {
                        Text("Source:")
                    }
                    if !article.keywords.isEmpty {
                        LabeledContent {
                            Text(article.keywords)
                        } label: {
                            Text("Keywords:")
                        }
                    }
                    if !article.categories.isEmpty {
                        LabeledContent {
                            Text(article.categories)
                        } label: {
                            Text("Categories:")
                        }
                    }
                }
                .font(.footnote)
                .padding(.horizontal)
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(.background)
                .background(NewsImageBackrgound())
            }
            .ignoresSafeArea()
            .navigationBarHidden(true)
            Button {
                dismiss()
            } label: {
                Image(systemName: "chevron.left.circle.fill")
                    .font(.title)
                    .fontWeight(.medium)
                    .foregroundStyle(Color.backButton)
                    .padding()
                    .opacity(0.5)
            }
        }
    }
}

#Preview {
    NewsScreen(article: AllNewsPreview.news[1])
}



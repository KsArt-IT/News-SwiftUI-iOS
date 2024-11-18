//
//  BigNewsItemView.swift
//  News-SUI
//
//  Created by KsArT on 18.11.2024.
//

import SwiftUI

struct NewsItemView: View {
    let article: NewsData
    
    var body: some View {
        VStack {
            NewsImageView(data: article.image)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            Text(article.title)
                .font(.title2)
            Text(article.description)
                .font(.caption)
            
        }
    }
}

#Preview {
//    BigNewsItemView()
}

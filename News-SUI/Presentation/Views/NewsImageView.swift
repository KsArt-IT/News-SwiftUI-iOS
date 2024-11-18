//
//  NewsImageView.swift
//  News-SUI
//
//  Created by KsArT on 18.11.2024.
//

import SwiftUI

struct NewsImageView: View {
    let data: Data?
    
    var body: some View {
        if let data = data, let image = UIImage(data: data) {
            Image(uiImage: image)
                .resizable()
                .scaledToFit()
        } else {
            Image("noImage")
                .resizable()
                .scaledToFit()
                .frame(width: 20)
                .clipped()
        }
    }
}

#Preview {
    NewsImageView(data: nil)
}

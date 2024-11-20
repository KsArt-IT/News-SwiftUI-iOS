//
//  NewsImageGeometryView.swift
//  News-SUI
//
//  Created by KsArT on 20.11.2024.
//

import SwiftUI

struct NewsImageGeometryView: View {
    let data: Data?
    
    var body: some View {
        GeometryReader { reader in
            if let data = data, let image = UIImage(data: data) {
                Image(uiImage: image)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .offset(y: -reader.frame(in: .global).minY)
                    .frame(width: Constants.screenWidth, height: reader.frame(in: .global).minY + Constants.photoHeight + 10)
            } else {
                Image("noImage")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20)
                    .clipped()
            }
        }
        .frame(height: Constants.photoHeight)
    }
}

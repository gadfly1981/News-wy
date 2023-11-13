//
//  NewsItemView.swift
//  News-wy
//
//  Created by wang yu on 2023/11/13.
//

import SwiftUI
import SDWebImageSwiftUI

struct NewsItemView: View {
    var oneNews: NewsTian
    
    var body: some View {
        VStack(alignment: .leading) {
            if !oneNews.picUrl.isEmpty {
                WebImage(url: URL(string: oneNews.picUrlFix))
                    .resizable()
                    .aspectRatio(1, contentMode: .fill)
                    .frame(maxWidth: .infinity, alignment: .center)
                Text(oneNews.title)
                    .multilineTextAlignment(.leading)
                    .frame(maxWidth: .infinity, maxHeight: 30, alignment: .leading)
                    .font(.title3)
                    .padding(.horizontal)
            } else {
                Text(oneNews.title)
                    .multilineTextAlignment(.leading)
                    .frame(maxWidth: .infinity, maxHeight: 30, alignment: .leading)
                    .font(.title3)
                    .padding(.horizontal)
                    .padding(.top)
            }
            Text(oneNews.description)
                .multilineTextAlignment(.leading)
                .frame(maxWidth: .infinity, maxHeight: 60, alignment: .leading)
                .font(.footnote)
                .foregroundStyle(.secondary)
                .padding(.horizontal)
                .padding(.bottom)
        }
        .overlay {
            RoundedRectangle(cornerRadius: 15, style: .continuous)
                .stroke(.gray, lineWidth: 1)
        }
        .clipShape(RoundedRectangle(cornerRadius: 15))
//        .padding()
    }
}

//#Preview {
//    NewsItemView()
//}

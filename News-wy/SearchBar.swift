//
//  SearchBar.swift
//  News-wy
//
//  Created by wang yu on 2023/11/12.
//

import SwiftUI

struct SearchBar: View {
    @Binding var text: String
    @Binding var news: [NewsTian]
    @Binding var page: Int
    @Binding var isEndPage: Bool
    @Binding var isEditing: Bool
    
    var body: some View {
        HStack {
            TextField("搜索...", text: $text)
                .padding(7)
                .padding(.horizontal, 25)
                .background(Color(.systemGray6))
                .cornerRadius(8)
                .overlay(
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.gray)
                            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                            .padding(.leading, 8)
                 
                        if isEditing {
                            Button(action: {
                                self.text = ""
                            }) {
                                Image(systemName: "multiply.circle.fill")
                                    .foregroundColor(.gray)
                                    .padding(.trailing, 8)
                            }
                        }
                    }
                )
                .padding(.horizontal, 10)
                .onTapGesture {
                    self.isEditing = true
                }
            
            if isEditing {
                Button(action: {
                    self.isEditing = false
                    UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder),
                                                    to: nil, 
                                                    from: nil, 
                                                    for: nil)
                    self.news = []
                    self.page = 1
                    self.isEndPage = false
                }) {
                    Text("确定")
                }
                .padding(.trailing, 10)
            }
        }
    }
}

#Preview {
    SearchBar(text: .constant(""), 
              news: .constant([]),
              page: .constant(1),
              isEndPage: .constant(false),
              isEditing: .constant(false))
}

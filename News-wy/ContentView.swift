//
//  ContentView.swift
//  News-wy
//
//  Created by wang yu on 2023/11/9.
//

import SwiftUI
import GoogleMobileAds
import SDWebImageSwiftUI

struct ContentView: View {
    
    @State var news: [NewsTian] = []
    @State var searchText = ""
    @State var page = 1
    @State var isEndPage = false
    @State var isEditing = false
//    private var bannerAdDelegate = BannerAdDelegate()
    
    var body: some View {
        VStack {
//            AdBannerView(adUnitID: "ca-app-pub-5753277101091282/6626003586",
//                         bannerAdDelegate: bannerAdDelegate)
//                .frame(height: 50)
            HStack {
                Text("新闻")
                    .font(.title)
                SearchBar(text: $searchText,
                          news: $news,
                          page: $page,
                          isEndPage: $isEndPage,
                          isEditing: $isEditing)
                if !isEditing {
                    Button {
                        
                    } label: {
                        Image(systemName: "line.3.horizontal")
                    }
                }
            }
            
            ScrollView {
                VStack {
                    LazyVGrid(columns: Array(repeating: GridItem(), count: columnCount),
                              spacing: 15) {
                        ForEach(news, id: \.id) { oneNews in
                            NewsItemView(oneNews: oneNews)
                        }
                    }
                    if !isEndPage {
                        LazyVGrid(columns: [GridItem()]) {
                            ProgressView()
                                .task {
                                    do {
                                        let result = try await NetworkManager.shared.getNews(type: .esports,
                                                                                             page: page,
                                                                                             searchText: searchText)
                                        DispatchQueue.main.async {
                                            if let result = result, !result.isEmpty {
                                                print(result)
                                                news.append(contentsOf: result)
                                                page += 1
                                                if result.count < 30 {
                                                    isEndPage = true
                                                }
                                            } else {
                                                isEndPage = true
                                            }
                                        }
                                    } catch {
                                        print(error.localizedDescription)
                                    }
                                }
                        }
                    }
                }
            }
            .scrollIndicators(.never)
            .scrollClipDisabled()
            .mask {
                Rectangle()
                    .padding(.bottom, -100)
                    .padding(.top, -10)
            }
        }
        .padding()
    }
    
    private var columnCount: Int {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return 1
        } else if UIDevice.current.userInterfaceIdiom == .pad {
            return 3
        } else {
            return 3
        }
    }
}

#Preview {
    ContentView()
}

// UIViewRepresentable wrapper for AdMob banner view
//struct AdBannerView: UIViewRepresentable {
//    let adUnitID: String
//    let bannerAdDelegate: BannerAdDelegate
//
//    func makeUIView(context: Context) -> GADBannerView {
//        let bannerView = GADBannerView(adSize: GADAdSizeFromCGSize(CGSize(width: 320, height: 50))) // Set your desired banner ad size
//        bannerView.adUnitID = adUnitID
//        bannerView.rootViewController = UIApplication.shared.windows.first?.rootViewController
//        bannerView.delegate = bannerAdDelegate
//        let request = GADRequest()
//        request.scene = UIApplication.shared.connectedScenes.first as? UIWindowScene
//        bannerView.load(request)
//        return bannerView
//    }
//    
//    func updateUIView(_ uiView: GADBannerView, context: Context) {}
//}

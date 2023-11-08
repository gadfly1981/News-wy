//
//  ContentView.swift
//  News-wy
//
//  Created by wang yu on 2023/11/9.
//

import SwiftUI
import GoogleMobileAds

struct ContentView: View {
    
    var body: some View {
        VStack {
            AdBannerView(adUnitID: "ca-app-pub-3940256099942544/2934735716")
                .frame(height: 50)
            
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
    }
}

#Preview {
    ContentView()
}

// UIViewRepresentable wrapper for AdMob banner view
struct AdBannerView: UIViewRepresentable {
    let adUnitID: String

    func makeUIView(context: Context) -> GADBannerView {
        let bannerView = GADBannerView(adSize: GADAdSizeFromCGSize(CGSize(width: 320, height: 50))) // Set your desired banner ad size
        bannerView.adUnitID = adUnitID
        bannerView.rootViewController = UIApplication.shared.windows.first?.rootViewController
        bannerView.load(GADRequest())
        return bannerView
    }
    
    func updateUIView(_ uiView: GADBannerView, context: Context) {}
}

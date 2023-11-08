//
//  SceneDelegate.swift
//  News-wy
//
//  Created by wang yu on 2023/11/9.
//

import Foundation
import GoogleMobileAds

class SceneDelegate: NSObject, UIWindowSceneDelegate, GADFullScreenContentDelegate {
    var appOpenAd: GADAppOpenAd?
    var loadTime = Date()
    
    func sceneDidBecomeActive(_ scene: UIScene) {
        tryToPresentAd()
    }
    
    func requestAppOpenAd() {
        let request = GADRequest()
        GADAppOpenAd.load(withAdUnitID: "ca-app-pub-3940256099942544/5662855259",
                          request: request,
                          orientation: UIInterfaceOrientation.portrait,
                          completionHandler: { (appOpenAdIn, _) in
            self.appOpenAd = appOpenAdIn
            let scenes = UIApplication.shared.connectedScenes
            let windowScene = scenes.first as? UIWindowScene
            let window = windowScene?.windows.last
            if let rwc = window?.rootViewController {
                appOpenAdIn?.present(fromRootViewController: rwc)
            }
        })
    }

    func tryToPresentAd() {
        if self.appOpenAd == nil {
            self.requestAppOpenAd()
        }
    }
}

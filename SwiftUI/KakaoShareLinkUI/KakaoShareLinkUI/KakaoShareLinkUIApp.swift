//
//  KakaoShareLinkUIApp.swift
//  KakaoShareLinkUI
//
//  Created by gnksbm on 2023/10/16.
//

import SwiftUI
import KakaoSDKCommon

class AppDelegate: UIResponder, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let kakaoKey = Bundle.main.object(forInfoDictionaryKey: "KAKAO_APP_KEY")
        KakaoSDK.initSDK(appKey: kakaoKey as? String ?? "")
        return true
    }
}

@main
struct KakaoShareLinkUIApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

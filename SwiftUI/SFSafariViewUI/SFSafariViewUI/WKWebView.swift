//
//  WKWebView.swift
//  SFSafariViewUI
//
//  Created by gnksbm on 2023/08/04.
//

import SwiftUI
import WebKit

struct WebView: UIViewRepresentable {
    var urlString: String
    
    func makeUIView(context: Context) -> some UIView {
        
        let webView =  WKWebView()
        if let url = URL(string: urlString) {
            webView.load(URLRequest(url: url))
        }
        return webView
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        
    }
}

struct WebView_Previews: PreviewProvider {
    static var previews: some View {
        WebView(urlString: "Https://naver.com")
    }
}

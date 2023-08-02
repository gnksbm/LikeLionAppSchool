//
//  ViewController.swift
//  WebViewKit
//
//  Created by gnksbm on 2023/08/02.
//

import UIKit
import WebKit

class ViewController: UIViewController {
    
    var webView: WKWebView!
    
    override func loadView() {
        let webConfiguration = WKWebViewConfiguration()
        webView = WKWebView(frame: .zero, configuration: webConfiguration)
        webView.uiDelegate = self
        view = webView
    }


    override func viewDidLoad() {
        super.viewDidLoad()
        
        let myURL = URL(string:"https://www.x.com")
        let myRequest = URLRequest(url: myURL!)
        webView.load(myRequest)
    }
}

extension ViewController: WKUIDelegate {
    
}

import SwiftUI
struct ViewController_Preview: PreviewProvider {
    static var previews: some View {
        UIKitVCPreview {
            ViewController()
        }
    }
}

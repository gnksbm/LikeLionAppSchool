//
//  SafariView.swift
//  ShoppingBasketUI
//
//  Created by gnksbm on 2023/08/04.
//

import SwiftUI
import SafariServices

struct SafariView: UIViewControllerRepresentable {
    let url: URL
    
    func makeUIViewController(context: Context) -> some UIViewController {
//        let url = URL(string: urlString) ?? URL(string: "https://www.apple.com/kr/shop/buy-mac/mac-pro")!
        let vc = SFSafariViewController(url: url)
        return vc
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        
    }
}

struct SafariView_Previews: PreviewProvider {
    static var previews: some View {
        SafariView(url: URL(string: "https://www.apple.com/kr/shop/buy-mac/mac-pro")!)
    }
}

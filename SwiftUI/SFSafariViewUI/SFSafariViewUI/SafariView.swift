//
//  SafariView.swift
//  SFSafariViewUI
//
//  Created by gnksbm on 2023/08/04.
//

import SwiftUI
import SafariServices

struct SafariView: UIViewControllerRepresentable {
    var urlString: String
    
    func makeUIViewController(context: Context) -> some UIViewController {
        
        let safariViewController = SFSafariViewController(url: URL(string: urlString)!)
        
        return safariViewController
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        
    }
}

struct MySafariView_Previews: PreviewProvider {
    static var previews: some View {
        SafariView(urlString: "Https://naver.com")
    }
}

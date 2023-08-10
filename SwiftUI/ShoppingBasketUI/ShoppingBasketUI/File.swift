//
//  File.swift
//  ShoppingBasketUI
//
//  Created by gnksbm on 2023/08/08.
//

import SwiftUI
import UIKit

class CustomPageViewController: UIPageViewController {
    var data: String?
    
    let button = UIButton()
    
    func setButton() {
        
        view.addSubview(button)
        button.addTarget(self, action: #selector(popVC), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        ])
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        setButton()
        button.setTitle(data, for: .normal)
    }
    
    @objc func popVC() {
        @State var binding = "ReBinding!!!!!!!!!!"
        let view = ContentView()
//        let view = ContentView(binding: $binding)
        let vc = UIHostingController(rootView: view)
        
        navigationController?.pushViewController(vc, animated: true)
    }
}

struct PageView: UIViewControllerRepresentable {
    @Binding var string: String
    
    func makeUIViewController(context: Context) -> some UIViewController {
        let vc = CustomPageViewController()
        return vc
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        (uiViewController as! CustomPageViewController).button.setTitle(string, for: .normal)
    }
}

struct PageView_Preview: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            PageView(string: .constant("123"))
        }
    }
}

//
//  TodayViewController.swift
//  VibeCloneKit
//
//  Created by gnksbm on 2023/08/11.
//

import UIKit

class TodayViewController: UIViewController {
    let todayView = TodayView()
    
    override func loadView() {
        view = todayView
        setNavigation()
        setToolbar()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.isToolbarHidden = false
    }
    
    func setNavigation() {
        let logoView = UIImageView(image: .init(named: "spotifyLogo"))
        logoView.contentMode = .scaleAspectFit
//        let logoBtn = UIBarButtonItem(image: .init(named: "spotifyLogo"), style: .plain, target: self, action: nil)
        let alertBtn = UIBarButtonItem(image: .init(systemName: "bell"), style: .plain, target: self, action: nil)
        let profileBtn = UIBarButtonItem(image: .init(systemName: "person.circle"), style: .plain, target: self, action: nil)
        
        [profileBtn, alertBtn].forEach{ $0.tintColor = .white }
        navigationItem.titleView = logoView
//        navigationItem.leftBarButtonItem = logoBtn
        navigationItem.rightBarButtonItems = [profileBtn, alertBtn]
    }
    
    func setToolbar() {
        navigationController?.isToolbarHidden = false
        navigationController?.toolbar.tintColor = .white
        let flexible = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil)
        let playBtn = UIBarButtonItem(barButtonSystemItem: .play, target: self, action: nil)
        let nextBtn = UIBarButtonItem(image: UIImage(systemName: "forward.end.fill"), style: .plain, target: self, action: nil)
        let playListBtn = UIBarButtonItem(image: UIImage(systemName: "music.note.list"), style: .plain, target: self, action: nil)
        self.toolbarItems = [flexible, playBtn, nextBtn, playListBtn]
    }
}

//MARK: - Preview

import SwiftUI
struct TodayViewController_Preview: PreviewProvider {
    static var previews: some View {
        UIKitVCPreview {
            PreviewController()
        }.background(.black)
    }
}

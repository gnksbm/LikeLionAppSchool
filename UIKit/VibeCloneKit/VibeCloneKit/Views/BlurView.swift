//
//  BlurView.swift
//  VibeCloneKit
//
//  Created by gnksbm on 2023/08/12.
//

import UIKit

class BlurView: UIVisualEffectView {
    
    //MARK: - init
    override init(effect: UIVisualEffect?) {
        let blurEffect = UIBlurEffect(style: .light)
        super.init(effect: blurEffect)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

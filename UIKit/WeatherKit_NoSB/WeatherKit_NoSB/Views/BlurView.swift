//
//  BlurView.swift
//  WeatherKit_NoSB
//
//  Created by gnksbm on 2023/07/17.
//

import UIKit

class BlurView: UIVisualEffectView {
    
    //MARK: - init
    override init(effect: UIVisualEffect?) {
        let blurEffect = UIBlurEffect(style: .systemUltraThinMaterial)
        super.init(effect: blurEffect)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}

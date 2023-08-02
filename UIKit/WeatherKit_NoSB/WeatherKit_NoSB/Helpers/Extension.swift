//
//  Extention.swift
//  WeatherKit_NoSB
//
//  Created by gnksbm on 2023/07/16.
//

import UIKit

struct UISize {
    static let screenWidth: CGFloat = UIScreen.main.bounds.width
    static let screenHeight: CGFloat = UIScreen.main.bounds.height
    
    struct CVCell {
        static var width = UISize.screenWidth / 4
        static var height = UISize.screenWidth / 4
        
        private init() { }
    }
    private init() { }
}

extension CGFloat {
    static var screenWidth = UIScreen.main.bounds.width
    static var screenHeight = UIScreen.main.bounds.height
    static var headerHeight = .screenHeight * 0.45
//    headerHeight * 0.42
    
    static var todayForcastCellWidth = .screenWidth / 6
    static var todayForcastCellHeight = .screenHeight / 6.5
    
    static var largeWeatherFont = CGFloat(100)
    static var mediumWeatherFont = CGFloat(35)
    static var smallWeatherFont = CGFloat(20)
    static var littleWeatherFont = CGFloat(15)
    
    static var dailyTVCellHeight = CGFloat(40)
}

extension UIView {
    func drawFullScreenAutoLayout(view: UIView, targetView: UIView) {
        view.translatesAutoresizingMaskIntoConstraints = false
        targetView.addSubview(view)
        NSLayoutConstraint.activate([
            view.centerXAnchor.constraint(equalTo: targetView.centerXAnchor),
            view.centerYAnchor.constraint(equalTo: targetView.centerYAnchor),
            view.widthAnchor.constraint(equalTo: targetView.widthAnchor),
            view.heightAnchor.constraint(equalTo: targetView.heightAnchor),
        ])
    }
}

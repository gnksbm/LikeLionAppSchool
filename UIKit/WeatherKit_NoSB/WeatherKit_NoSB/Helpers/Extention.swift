//
//  Extention.swift
//  WeatherKit_NoSB
//
//  Created by gnksbm on 2023/07/16.
//

import UIKit

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


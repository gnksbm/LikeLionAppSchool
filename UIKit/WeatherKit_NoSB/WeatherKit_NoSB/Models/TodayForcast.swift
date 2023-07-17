//
//  TodayForcast.swift
//  WeatherKit_NoSB
//
//  Created by gnksbm on 2023/07/17.
//

import UIKit

struct TodayForcast {
    var time: String
    var image: UIImage?
    var degree: String
    
    init(time: String, image: UIImage? = nil, degree: String) {
        self.time = time
        self.image = image
        self.degree = degree
    }
}

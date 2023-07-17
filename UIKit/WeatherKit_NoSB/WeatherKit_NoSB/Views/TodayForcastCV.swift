//
//  TodayForcastCV.swift
//  WeatherKit_NoSB
//
//  Created by gnksbm on 2023/07/17.
//

import UIKit

class TodayForcastCV: UICollectionView {
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        self.register(TodayForcastTVCell.self, forCellWithReuseIdentifier: TodayForcastTVCell.identifier)
    }
    let flowLayout = UICollectionViewFlowLayout()
    flowLayout.scrollDirection = .horizontal
    flowLayout.minimumLineSpacing = 50
    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
    
    return collectionView

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}

//
//  SecondTVCell.swift
//  WeatherKit_NoSB
//
//  Created by gnksbm on 2023/07/22.
//

import UIKit

class SecondTVCell: MainBlurTVCell {

    static let identifier = "SecondTVCell"
    
    lazy var todayForcastCV: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        flowLayout.itemSize = .init(width: .todayForcastCellWidth, height: .todayForcastCellHeight)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        collectionView.register(TodayForcastCVCell.self, forCellWithReuseIdentifier: TodayForcastCVCell.identifier)
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.backgroundColor = .clear
        collectionView.dataSource = self
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        drawFullScreenAutoLayout(view: todayForcastCV, targetView: contentView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension SecondTVCell: UICollectionViewDataSource {
    //MARK: - TodayForcastTVCell: Section
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        24
    }
    //MARK: - TodayForcastTVCell: Cell
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TodayForcastCVCell.identifier, for: indexPath) as! TodayForcastCVCell
        return cell
    }
}


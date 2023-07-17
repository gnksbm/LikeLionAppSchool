//
//  TodayForcastView.swift
//  WeatherKit_NoSB
//
//  Created by gnksbm on 2023/07/17.
//

import UIKit

class TodayForcastView: UIView {
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
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureUI() {
        self.backgroundColor = .clear
        setTodayForcastCV()
    }
    func setTodayForcastCV() {
        self.addSubview(todayForcastCV)
        
        NSLayoutConstraint.activate([
            todayForcastCV.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            todayForcastCV.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            todayForcastCV.topAnchor.constraint(equalTo: self.topAnchor),
            todayForcastCV.bottomAnchor.constraint(equalTo: self.bottomAnchor),
        ])
    }
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}

extension TodayForcastView: UICollectionViewDataSource {
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

//extension TodayForcastView: UICollectionViewDelegateFlowLayout {
//    //MARK: - TodayForcastTVCell: CellSize
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        return CGSize(width: .todayForcastCellWidth, height: .todayForcastCellHeight)
//    }
//}

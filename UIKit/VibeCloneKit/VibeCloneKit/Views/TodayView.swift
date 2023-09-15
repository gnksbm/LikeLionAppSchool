//
//  TodayView.swift
//  VibeCloneKit
//
//  Created by gnksbm on 2023/08/11.
//

import UIKit


class TodayView: UIView {
    
//    var cellRegistration: UICollectionView.CellRegistration< , >!
    var dataSource: UICollectionViewDiffableDataSource<TodaySection, ModernCVData.ID>!
    var snapshot: NSDiffableDataSourceSnapshot<TodaySection, ModernCVData.ID>!
    
    lazy var todayCV: UICollectionView = {
        let compositionalLayout = makeLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: compositionalLayout)
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "SomeCell")
        collectionView.dataSource = dataSource
        collectionView.backgroundColor = .red
        return collectionView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setDataSource()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func updateConstraints() {
        self.addSubview(todayCV)
        todayCV.translatesAutoresizingMaskIntoConstraints = false
        todayCV.fitSafeArea()
        super.updateConstraints()
    }
}

//MARK: - Preview

import SwiftUI
struct TodayView_Preview: PreviewProvider {
    static var previews: some View {
        UIKitVCPreview {
            PreviewController()
        }
    }
}

//
//  ChartView.swift
//  VibeCloneKit
//
//  Created by gnksbm on 2023/08/11.
//

import UIKit

class ChartView: UIView {
    //    var cellRegistration: UICollectionView.CellRegistration< , >!
    var dataSource: UICollectionViewDiffableDataSource<Int, UUID>!
    var snapshot: NSDiffableDataSourceSnapshot<Int, UUID>!
    
    lazy var chartCV: UICollectionView = {
        let flowLayout = makeCompositionalLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
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
        self.addSubview(chartCV)
        chartCV.translatesAutoresizingMaskIntoConstraints = false
        chartCV.fitSuperView()
        super.updateConstraints()
    }
}

extension ChartView {
    func setDataSource() {
        // TODO: - cell을 UICollectionView.CellRegistration를 이용하여 dequeueConfiguredReusableCell로 변경,
        
        dataSource = .init(collectionView: chartCV, cellProvider: { collectionView, indexPath, itemIdentifier in
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SomeCell", for: indexPath)
            cell.backgroundColor = .black
            return cell
        })
        setSnapshot()
        dataSource.apply(snapshot)
    }
    
    func setSnapshot() {
        snapshot = .init()
        snapshot.appendSections([0])
        snapshot.appendItems([UUID(), UUID(), UUID(), UUID(), UUID(), UUID(), UUID(), UUID(), UUID(), UUID(), UUID(), ])
    }

    func makeCompositionalLayout() -> UICollectionViewCompositionalLayout {
        let itemInset = NSDirectionalEdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10)
        let item = NSCollectionLayoutItem(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1),
                heightDimension: .fractionalHeight(1/3)
            )
        )
        item.contentInsets = itemInset
        let group = NSCollectionLayoutGroup.vertical(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1),
                heightDimension: .fractionalHeight(1)
            ), subitems: [
                item
            ])
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .paging
        return UICollectionViewCompositionalLayout(section: section)
    }
}

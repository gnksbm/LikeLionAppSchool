//
//  ViewController.swift
//  CompositionalCollectionViewKit
//
//  Created by gnksbm on 2023/08/08.
//

import UIKit

class ViewController: UIViewController {
    let networkManager = NetworkManager.shared
    let myModel = MyCollectionViewModel()
    
    var dataSource: UICollectionViewDiffableDataSource<Int, RestaurantData.ID>!
    var snapshot: NSDiffableDataSourceSnapshot<Int, RestaurantData.ID>!
    
    lazy var restaurantCV: UICollectionView = {
        let layout = self.makeCompositionalLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(RestaurantCVCell.self, forCellWithReuseIdentifier: "i")
        collectionView.dataSource = dataSource
        return collectionView
    }()
    
    override func loadView() {
        view = restaurantCV
        setDataSource()
        myModel.fetchData {
            self.snapshot.appendItems(self.myModel.datas.map { $0.id })
            self.dataSource.apply(self.snapshot)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setNavigationBtn()
    }
    
    func setNavigationBtn() {
        let deleteBtn = UIBarButtonItem(image: UIImage(systemName: "minus.circle.fill"), style: .plain, target: self, action: #selector(removeBtnTapped))
        let appendBtn = UIBarButtonItem(image: UIImage(systemName: "text.badge.plus"), style: .plain, target: self, action: #selector(appendBtnTapped))
        self.navigationItem.rightBarButtonItems = [deleteBtn, appendBtn]
    }
    
    func setDataSource() {
        //TODO: - cell을 UICollectionView.CellRegistration를 이용하여 dequeueConfiguredReusableCell로 변경, 
        dataSource = .init(collectionView: restaurantCV, cellProvider: { collectionView, indexPath, itemIdentifier in
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "i", for: indexPath) as! RestaurantCVCell
            cell.data = self.myModel.datas[indexPath.row]
            return cell
        })
        snapshot = .init()
        snapshot.appendSections([0])
        snapshot.appendItems(myModel.datas.compactMap { $0.id })
        dataSource.apply(snapshot)
    }
    
    @objc func appendBtnTapped() {
        myModel.fetchData {
            self.snapshot.appendItems(self.myModel.datas.map { $0.id })
            self.dataSource.apply(self.snapshot)
        }
    }
    
    @objc func removeBtnTapped() {
        guard !myModel.datas.isEmpty else { return }
        guard let firstItem = snapshot.itemIdentifiers.first else {
            print("removeBtnTapped: firstItem 옵셔널 바인딩 실패")
            return
        }
        myModel.datas.remove(at: 0)
        snapshot.deleteItems([firstItem])
        dataSource.apply(snapshot)
    }
}

extension ViewController {
    func makeCompositionalLayout() -> UICollectionViewCompositionalLayout {
        let itemInset = NSDirectionalEdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10)
        let topItem = NSCollectionLayoutItem(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1),
                heightDimension: .fractionalHeight(1/3)
            )
        )
        topItem.contentInsets = itemInset
        let midLItem = NSCollectionLayoutItem(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1/2),
                heightDimension: .fractionalHeight(1)
            )
        )
        midLItem.contentInsets = itemInset
        let midGroupItem = NSCollectionLayoutItem(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1),
                heightDimension: .fractionalHeight(1/2)
            )
        )
        midGroupItem.contentInsets = itemInset
        let btmLItem = NSCollectionLayoutItem(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1/2),
                heightDimension: .fractionalHeight(1)
            )
        )
        btmLItem.contentInsets = itemInset
        let btmRItem = NSCollectionLayoutItem(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1),
                heightDimension: .fractionalHeight(1/3)
            )
        )
        btmRItem.contentInsets = itemInset
        let midRGroup = NSCollectionLayoutGroup.vertical(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1/2),
                heightDimension: .fractionalHeight(1)
            ), subitems: [midGroupItem])
        let midGroup = NSCollectionLayoutGroup.horizontal(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1),
                heightDimension: .fractionalHeight(1/3)
            ), subitems: [midLItem, midRGroup])
        let btmLGroup = NSCollectionLayoutGroup.horizontal(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(3/4),
                heightDimension: .fractionalHeight(1)
            ), subitems: [btmLItem])
        let btmRGroup = NSCollectionLayoutGroup.vertical(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1/4),
                heightDimension: .fractionalHeight(1)
            ), subitems: [btmRItem])
        let btmGroup = NSCollectionLayoutGroup.horizontal(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1),
                heightDimension: .fractionalHeight(1/3)
            ), subitems: [btmLGroup, btmRGroup])
        let totalGroup = NSCollectionLayoutGroup.vertical(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1),
                heightDimension: .fractionalHeight(1)
            ), subitems: [
                topItem,
                midGroup,
                btmGroup
            ])
        let section = NSCollectionLayoutSection(group: totalGroup)
        section.orthogonalScrollingBehavior = .paging
        return UICollectionViewCompositionalLayout(section: section)
    }
}

//MARK: - Preview

import SwiftUI
struct ViewController_Preview: PreviewProvider {
    static var previews: some View {
        UIKitVCPreview {
           UINavigationController(rootViewController: ViewController())
        }
    }
}

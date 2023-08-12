//
//  ViewController.swift
//  CompositionalCollectionViewKit
//
//  Created by gnksbm on 2023/08/08.
//

import UIKit

class ViewController: UIViewController {
    let networkManager = NetworkManager.shared
    let myModel = RestaurantModel()
    
    var cellRegistration: UICollectionView.CellRegistration<RestaurantCVCell, RestaurantData>!
    var dataSource: UICollectionViewDiffableDataSource<Int, RestaurantData.ID>!
    var snapshot: NSDiffableDataSourceSnapshot<Int, RestaurantData.ID>!
    
    lazy var restaurantCV: UICollectionView = {
        let layout = makeCompositionalLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(RestaurantCVCell.self, forCellWithReuseIdentifier: RestaurantCVCell.identifier)
        collectionView.dataSource = dataSource
        collectionView.refreshControl = UIRefreshControl()
        collectionView.refreshControl?.addTarget(self, action: #selector(appendBtnTapped), for: .valueChanged)
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setDataSource()
        setNavigationBtn()
        configureUI()
        myModel.fetchData {
            self.snapshot.appendItems(self.myModel.datas.map { $0.id })
            self.dataSource.apply(self.snapshot)
        }
    }
    
    func configureUI() {
        restaurantCV.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(restaurantCV)
        restaurantCV.fitSuperView()
    }
    
    func setNavigationBtn() {
        let deleteBtn = UIBarButtonItem(image: UIImage(systemName: "minus.circle.fill"), style: .plain, target: self, action: #selector(removeBtnTapped))
        let shuffleBtn = UIBarButtonItem(image: UIImage(systemName: "arrow.clockwise"), style: .plain, target: self, action: #selector(shuffleBtnTapped))
//        let appendBtn = UIBarButtonItem(image: UIImage(systemName: "text.badge.plus"), style: .plain, target: self, action: #selector(appendBtnTapped))
//        self.navigationItem.rightBarButtonItems = [deleteBtn, appendBtn]
        self.navigationItem.rightBarButtonItems = [deleteBtn, shuffleBtn]
        title = "대구시 맛집"
    }
    
    @objc func appendBtnTapped() {
        myModel.fetchData {
            self.snapshot.reloadItems(self.myModel.datas.map { $0.id })
            self.dataSource.apply(self.snapshot)
        }
        DispatchQueue.main.async {
            self.restaurantCV.refreshControl?.endRefreshing()
        }
    }
    
    @objc func removeBtnTapped() {
        guard !myModel.datas.isEmpty else { return }
        guard let firstItem = snapshot.itemIdentifiers.first else {
            print(#function + " - error")
            return
        }
        myModel.datas.remove(at: 0)
        snapshot.deleteItems([firstItem])
        dataSource.apply(snapshot)
    }
    
    @objc func shuffleBtnTapped() {
        guard !myModel.datas.isEmpty else { return }
        myModel.datas.shuffle()
        snapshot.reloadItems(self.myModel.datas.map { $0.id })
        dataSource.apply(snapshot)
    }
}

// MARK: - UICollectionViewCompositionalLayout, UICollectionViewDiffableDataSource

extension ViewController {
    func setDataSource() {
        // TODO: - cell을 UICollectionView.CellRegistration를 이용하여 dequeueConfiguredReusableCell로 변경,
        
        dataSource = .init(collectionView: restaurantCV, cellProvider: { collectionView, indexPath, itemIdentifier in
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RestaurantCVCell.identifier, for: indexPath) as! RestaurantCVCell
            cell.data = self.myModel.datas[indexPath.row]
            return cell
        })
        setSnapshot()
        dataSource.apply(snapshot)
    }
    
    func setSnapshot() {
        snapshot = .init()
        snapshot.appendSections([0])
        snapshot.appendItems(myModel.datas.compactMap { $0.id })
    }
    
    func setCellRegistration() {
        cellRegistration = .init(handler: { cell, indexPath, itemIdentifier in
            //            cell.configure
        })
    }
    
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

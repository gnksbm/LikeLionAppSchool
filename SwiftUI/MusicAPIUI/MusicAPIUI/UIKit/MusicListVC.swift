//
//  MusicListVC.swift
//  MusicAPIUI
//
//  Created by gnksbm on 2023/08/14.
//

import UIKit
import SwiftUI

class MusicListVC: UIViewController {
    var musicData = MusicData()
    var dataSource: UICollectionViewDiffableDataSource<Int, MyMusic.ID>!
    var snapshot: NSDiffableDataSourceSnapshot<Int, MyMusic.ID>!
    
    lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: makeLayout())
        collectionView.dataSource = dataSource
        collectionView.register(MusicCVCell.self, forCellWithReuseIdentifier: MusicCVCell.identifier)
        collectionView.backgroundColor = .systemTeal
        return collectionView
    }()
    
    override func loadView() {
        view = collectionView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        musicData.fetchData {
            self.appendDataSource()
        }
        setCollectionView()
        setNavi()
    }
    
    deinit {
        print(#function)
    }
    
    func setNavi() {
        let fetchBtn = UIBarButtonItem(image: UIImage(systemName: "plus"), style: .plain, target: self, action: nil)
        navigationController?.isNavigationBarHidden = false
        navigationItem.rightBarButtonItem = fetchBtn
    }
    
    func makeLayout() -> UICollectionViewCompositionalLayout {
        let item = NSCollectionLayoutItem(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1/2),
                heightDimension: .fractionalHeight(1)
            )
        )
        item.contentInsets = .init(top: 5, leading: 5, bottom: 5, trailing: 5)
        let horizontalGroup = NSCollectionLayoutGroup.horizontal(layoutSize: NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .fractionalWidth(1/2)
        ), subitems: [item])
        let group = NSCollectionLayoutGroup.vertical(layoutSize: NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .fractionalWidth(1)
        ), subitems: [horizontalGroup])
        let section = NSCollectionLayoutSection(group: group)
        return UICollectionViewCompositionalLayout(section: section)
    }
    func appendDataSource() {
        snapshot.appendItems(musicData.myMusics.map({ $0.id }))
        dataSource.apply(snapshot)
    }
    func setCollectionView() {
        dataSource = .init(collectionView: collectionView, cellProvider: { [weak self] collectionView, indexPath, itemIdentifier in
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MusicCVCell.identifier, for: indexPath) as! MusicCVCell
            cell.data = self?.musicData.myMusics[indexPath.row]
            cell.backgroundColor = .red
            return cell
        })
        snapshot = .init()
        snapshot.appendSections([0])
        snapshot.appendItems(musicData.myMusics.map({ $0.id }))
        dataSource.apply(snapshot)
    }
}

struct MusicView: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> some UIViewController {
        let vc = MusicListVC()
        return vc
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        
    }
}

struct MusicPreview: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            MusicView()
        }
    }
}

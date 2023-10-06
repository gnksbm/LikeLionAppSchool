//
//  ViewController.swift
//  URLImageKit
//
//  Created by gnksbm on 2023/10/06.
//

import UIKit

final class ViewController: UIViewController {
    private let networkManager = NetworkManager.shared
    
    private var myModels: [MyModel] = []
    
    private let urlStrings: [String] = [
        "https://wallpaperaccess.com/download/europe-4k-1369012",
        "https://wallpaperaccess.com/download/europe-4k-1318341"
    ]
    
    private var dataSource: UICollectionViewDiffableDataSource<Int, MyModel>!
    private var snapshot: NSDiffableDataSourceSnapshot<Int, MyModel>!
    
    lazy var imageCV: UICollectionView = {
        let layout = makeLayout()
        let cv = UICollectionView(frame: .infinite, collectionViewLayout: layout)
        cv.dataSource = dataSource
        cv.register(ImageCVCell.self, forCellWithReuseIdentifier: ImageCVCell.identifier)
        return cv
    }()
    
    override func loadView() {
        view = imageCV
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setDataSource()
        Task {
            await fetchImages(urlStrings: urlStrings)
        }
    }
    
    @MainActor
    private func fetchImages(urlStrings: [String]) async {
        await urlStrings.asyncForEach { [weak self] urlString in
            await self?.fetchImage(urlString: urlString)
        }
    }
    
    @MainActor
    private func fetchImage(urlString: String) async {
        guard let url = URL(string: urlString) else { return }
        let result = await networkManager.fetchData(url: url)
        switch result {
        case .success(let success):
            myModels.append(.init(imageData: success))
            updateSnapshot()
        case .failure:
            break
        }
    }
}

extension ViewController {
    private func setDataSource() {
        let registration = makeCellRegistration()
        dataSource = .init(collectionView: imageCV) { collectionView, indexPath, myModel in
            let cell = collectionView.dequeueConfiguredReusableCell(using: registration, for: indexPath, item: myModel)
            return cell
        }
        updateSnapshot()
    }
    
    private func makeCellRegistration() ->
    UICollectionView.CellRegistration<ImageCVCell, MyModel> {
        let config: UICollectionView.CellRegistration<ImageCVCell, MyModel>
        config = .init { cell, indexPath, myModel in
            cell.imageView.image = UIImage(data: myModel.imageData)
        }
        return config
    }
    
    private func makeLayout() ->
    UICollectionViewCompositionalLayout {
        return .init { _, _ in
            let item: NSCollectionLayoutItem
            let group: NSCollectionLayoutGroup
            let section: NSCollectionLayoutSection
            let screenWidth = UIScreen.main.bounds.width
            
            item = .init(
                layoutSize: NSCollectionLayoutSize(
                    widthDimension: .fractionalWidth(1),
                    heightDimension: .fractionalHeight(1)
                )
            )
            group = .horizontal(
                layoutSize: NSCollectionLayoutSize(
                    widthDimension: .fractionalWidth(1),
                    heightDimension: .fractionalWidth(1)
                ), subitems: [item])
            group.contentInsets = .init(top: screenWidth / 20, leading: screenWidth / 20, bottom: screenWidth / 20, trailing: screenWidth / 20)
            section = .init(group: group)
            section.contentInsets = .init(top: screenWidth / 20, leading: screenWidth / 20, bottom: screenWidth / 20, trailing: screenWidth / 20)
            return section
        }
    }
    
    private func updateSnapshot() {
        snapshot = .init()
        snapshot.appendSections([0])
        snapshot.appendItems(myModels)
        dataSource.apply(snapshot)
    }
}

import SwiftUI
struct ViewController_Preview: PreviewProvider {
    static var previews: some View {
        UIKitPreview {
            ViewController()
        }
    }
}

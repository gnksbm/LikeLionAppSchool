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
        let cv = UICollectionView(
            frame: .infinite,
            collectionViewLayout: layout
        )
        cv.dataSource = dataSource
        cv.register(
            ImageCVCell.self,
            forCellWithReuseIdentifier: ImageCVCell.identifier
        )
        return cv
    }()
    
    override func loadView() {
        view = imageCV
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setDataSource()
        setNavigation()
        Task {
            await fetchImages(urlStrings: urlStrings)
        }
    }
    
    func setNavigation() {
        navigationItem.setRightBarButton(.init(title: "reset", style: .plain, target: self, action: #selector(resetBtnTapped)), animated: true)
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
        let result = await networkManager.fetchImage(url: url)
        switch result {
        case .success(let success):
            myModels.append(.init(imageData: success))
            updateSnapshot()
        case .failure:
            break
        }
    }
    
    @objc private func resetBtnTapped() {
        myModels = []
        Task {
            await fetchImages(urlStrings: urlStrings)
        }
    }
}

extension ViewController {
    private func setDataSource() {
        let registration = makeCellRegistration()
        dataSource = .init(collectionView: imageCV) { collectionView, indexPath, myModel in
            let cell = collectionView.dequeueConfiguredReusableCell(
                using: registration,
                for: indexPath,
                item: myModel
            )
            return cell
        }
        updateSnapshot()
    }
    
    private func makeCellRegistration() ->
    UICollectionView.CellRegistration<ImageCVCell, MyModel> {
        return .init { cell, indexPath, myModel in
            cell.imageView.image = myModel.imageData
        }
    }
    
    private func makeLayout() ->
    UICollectionViewCompositionalLayout {
        return .init { _, _ in
            let insetValue = CGFloat.screenWidth / 20
            let item = NSCollectionLayoutItem(
                layoutSize: NSCollectionLayoutSize(
                    widthDimension: .fractionalWidth(1),
                    heightDimension: .fractionalHeight(1)
                )
            )
            let group = NSCollectionLayoutGroup.horizontal(
                layoutSize: NSCollectionLayoutSize(
                    widthDimension: .fractionalWidth(1),
                    heightDimension: .fractionalWidth(1)
                ), subitems: [item])
            group.contentInsets = .init(top: insetValue, leading: insetValue, bottom: insetValue, trailing: insetValue)
            let section = NSCollectionLayoutSection(group: group)
            section.contentInsets = .init(top: insetValue, leading: insetValue, bottom: insetValue, trailing: insetValue)
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

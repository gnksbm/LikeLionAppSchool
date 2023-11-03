//
//  ViewController.swift
//  URLImageKit
//
//  Created by gnksbm on 2023/10/06.
//

import UIKit

final class ViewController: UIViewController {
    private let viewModel = ViewModel()
    
    private var dataSource: UICollectionViewDiffableDataSource<Int, MyModel>!
    private var snapshot: NSDiffableDataSourceSnapshot<Int, MyModel>!
    
    lazy var imageCV: UICollectionView = {
        let layout = makeLayout()
        let cv = UICollectionView(frame: .infinite, collectionViewLayout: layout)
        cv.dataSource = dataSource
        return cv
    }()
    
    override func loadView() {
        view = imageCV
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setDataSource()
        setNavigation()
        viewModel.setOnCompleteAction(setDataSource)
        Task {
            await viewModel.getImages()
        }
    }
    
    private func setNavigation() {
        let resetBtn = UIBarButtonItem(image: UIImage(systemName: "arrow.clockwise"), style: .plain, target: self, action: #selector(resetBtnTapped))
        navigationItem.setRightBarButton(resetBtn, animated: true)
    }
    
    @objc private func resetBtnTapped() {
        Task {
            await viewModel.refreshImages()
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
        snapshot.appendItems(viewModel.myModels)
        dataSource.apply(snapshot)
    }
}

import SwiftUI
struct ViewController_Preview: PreviewProvider {
    static var previews: some View {
        UIKitPreview {
            UINavigationController(rootViewController: ViewController())
        }
    }
}

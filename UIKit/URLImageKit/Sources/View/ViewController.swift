//
//  ViewController.swift
//  URLImageKit
//
//  Created by gnksbm on 2023/10/06.
//

import UIKit

final class ViewController: UIViewController {
    private let viewModel = ViewModel()
    
    private var dataSource: UICollectionViewDiffableDataSource<Section, MyModel>!
    private var snapshot: NSDiffableDataSourceSnapshot<Section, MyModel>!
    
    lazy var collectionView: UICollectionView = {
        let layout = makeLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.dataSource = dataSource
        return cv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        setDataSource()
        setNavigation()
        viewModel.setOnCompleteAction(setDataSource)
        Task {
            await viewModel.getImages()
        }
    }
    
    func configureUI() {
        [collectionView].forEach {
            view.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        let safeArea = view.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            collectionView.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor),
            collectionView.centerYAnchor.constraint(equalTo: safeArea.centerYAnchor),
            collectionView.widthAnchor.constraint(equalTo: safeArea.widthAnchor),
            collectionView.heightAnchor.constraint(equalTo: safeArea.heightAnchor),
        ])
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
// MARK: CollectionView
extension ViewController {
    // MARK: layout
    private func makeLayout() ->
    UICollectionViewCompositionalLayout {
        return .init { sectionIndex, _ in
            return Section.allCases[sectionIndex].getCompositionalSection()
        }
    }
    // MARK: DataSource
    private func setDataSource() {
        let registration = makeCellRegistration()
        dataSource = .init(collectionView: collectionView) { collectionView, indexPath, myModel in
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
    // MARK: Snapshot
    private func updateSnapshot() {
        snapshot = .init()
        let sections = Section.allCases
        snapshot.appendSections(sections)
        sections.forEach {
            switch $0 {
            case .image:
                snapshot.appendItems(viewModel.myModels, toSection: $0)
            }
        }
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

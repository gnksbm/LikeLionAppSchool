//
//  ViewController.swift
//  ColloectionViewKit
//
//  Created by gnksbm on 2023/07/26.
//

import UIKit
import SwiftUI

class ViewController: UIViewController {
    let cvCellSize = CVCellSize(rows: 3, columns: 5, spacing: 20, insetTop: 10, insetLeft: 10, insetBottom: 10, insetRight: 10, height: 20)
    
    lazy var collectionView: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        flowLayout.minimumLineSpacing = cvCellSize.lineSpacing ?? cvCellSize.spacing
        flowLayout.minimumInteritemSpacing = cvCellSize.spacing
        flowLayout.itemSize = CGSize(width: cvCellSize.width, height: cvCellSize.height ?? cvCellSize.width)
        flowLayout.sectionInset = cvCellSize.inset
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "a")
        collectionView.dataSource = self
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(collectionView)
        
        NSLayoutConstraint.activate([
            collectionView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            collectionView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            collectionView.widthAnchor.constraint(equalTo: view.widthAnchor),
            collectionView.heightAnchor.constraint(equalToConstant: cvCellSize.viewHeight),
        ])
    }
    
}

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        90
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "a", for: indexPath)
        cell.backgroundColor = .black
        return cell
    }
}

struct VCPreview: PreviewProvider {
    static var previews: some View {
        ViewControllerPreview {
            ViewController()
        }
    }
}

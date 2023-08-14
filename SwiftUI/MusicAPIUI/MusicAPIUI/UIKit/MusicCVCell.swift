//
//  MusicCVCell.swift
//  MusicAPIUI
//
//  Created by 연수영 on 2023/08/14.
//

import UIKit

class MusicCVCell: UICollectionViewCell {
    static let identifier = "MusicCVCell"
    
    let imageView = UIImageView(image: nil)
    
    var data: MyMusic? {
        didSet {
            DispatchQueue.global().async {
                guard let data = self.data else { return }
                guard let imageData = try? Data(contentsOf: data.urlString) else { return }
                DispatchQueue.main.async {
                    self.imageView.image = UIImage(data: imageData)
                }
            }
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    deinit {
        print("cell deinit")
    }
    
    func configureUI() {
        imageView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(imageView)
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
        ])
    }
}

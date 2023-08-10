//
//  FoodCVCell.swift
//  CompositionalCollectionViewKit
//
//  Created by gnksbm on 2023/08/08.
//

import UIKit

class RestaurantCVCell: UICollectionViewCell {
    var data: RestaurantData? {
        didSet {
            customLabel.text = data?.name
        }
    }
    
    let customLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .systemTeal
        contentView.layer.cornerRadius = 10
//        contentView.layer.borderWidth = 1
        contentView.clipsToBounds = true
        drawTitleLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func drawTitleLabel() {
        customLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(customLabel)
        
        NSLayoutConstraint.activate([
            customLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            customLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            customLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
            customLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
        ])
    }

    
    
}

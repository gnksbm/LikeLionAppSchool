//
//  FoodCVCell.swift
//  CompositionalCollectionViewKit
//
//  Created by gnksbm on 2023/08/08.
//

import UIKit

class RestaurantCVCell: UICollectionViewCell {
    static let identifier = "RestaurantCVCell"
    
    var data: RestaurantData? {
        didSet {
            titleLabel.text = data?.name
        }
    }
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .systemTeal
        contentView.layer.cornerRadius = 4
        contentView.clipsToBounds = true
        drawTitleLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func drawTitleLabel() {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(titleLabel)
        titleLabel.fitSuperView()
    } 
}

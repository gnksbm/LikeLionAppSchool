//
//  SearchLocationTVCell.swift
//  
//
//  Created by gnksbm on 2023/12/24.
//

import UIKit

final class SearchLocationTVCell: UITableViewCell {
    let titleLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: Self.identifier)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        titleLabel.text = nil
    }
    
    private func configureUI() {
        contentView.addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            titleLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            titleLabel.widthAnchor.constraint(
                equalTo: contentView.widthAnchor,
                multiplier: 0.9
            ),
            titleLabel.heightAnchor.constraint(
                equalTo: contentView.heightAnchor,
                multiplier: 0.9
            ),
        ])
    }
}

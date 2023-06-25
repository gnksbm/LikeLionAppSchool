//
//  ButtonTVCell.swift
//  MultipleChoiceQuizKit
//
//  Created by gnksbm on 2023/06/22.
//

import UIKit

class ButtonTVCell: UITableViewCell {
    static let identifier = "ButtonTVCell"
//    @IBOutlet weak var buttonCellLabel: UILabel!
    var gradientLayer: CAGradientLayer!
    
    lazy var buttonCellLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .clear
        label.font = .boldSystemFont(ofSize: 15)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureUI()
        print("init")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5))
        print("layout")
    }
    override func layoutSublayers(of layer: CALayer) {
        super.layoutSublayers(of: layer)
        print("layout")
        setGradient()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureUI() {
        self.backgroundColor = .clear
        self.contentView.backgroundColor = .systemPink
        self.contentView.layer.cornerRadius = 10
        
        self.contentView.addSubview(buttonCellLabel)
        
        NSLayoutConstraint.activate([
            buttonCellLabel.centerXAnchor.constraint(equalTo: self.contentView.centerXAnchor),
            buttonCellLabel.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor),
        ])
    }
    
    func setGradient() {
        gradientLayer = CAGradientLayer()
        gradientLayer.frame = self.contentView.bounds
        gradientLayer.colors = [UIColor.clear, UIColor.systemPink]
        contentView.layer.addSublayer(gradientLayer)
    }
    
}


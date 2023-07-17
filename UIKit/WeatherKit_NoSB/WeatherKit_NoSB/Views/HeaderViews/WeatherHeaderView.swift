//
//  WeatherHeaderView.swift
//  WeatherKit_NoSB
//
//  Created by gnksbm on 2023/07/16.
//

import UIKit

class WeatherHeaderView: UITableViewHeaderFooterView {
    
    static let identifier = "WeatherHeaderView"
    
    //MARK: - View
    lazy var blurView: BlurView = {
        let view = BlurView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.tintColor = UIColor(named: "TintColor")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(named: "TintColor")
        label.font = UIFont.systemFont(ofSize: 13)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    //MARK: - init
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - func
    func configureUI() {
        self.layer.masksToBounds = true
        self.layer.cornerRadius = 15
        self.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        self.backgroundColor = .clear
        contentView.layer.masksToBounds = true
        contentView.layer.cornerRadius = 15
        contentView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        contentView.backgroundColor = .clear
        setBlurView()
        setImageView()
        setLabel()
    }
    
    func setBlurView() {
        contentView.backgroundColor = .clear
        contentView.addSubview(blurView)
        
        NSLayoutConstraint.activate([
            blurView.widthAnchor.constraint(equalTo: contentView.widthAnchor),
            blurView.heightAnchor.constraint(equalTo: contentView.heightAnchor),
        ])
    }
    
    func setImageView() {
        
        contentView.addSubview(imageView)
        NSLayoutConstraint.activate([
            imageView.leadingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.leadingAnchor, constant: 15),
            imageView.widthAnchor.constraint(equalToConstant: 15),
            imageView.heightAnchor.constraint(equalToConstant: 15),
            imageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
        ])
    }
    
    func setLabel() {
        contentView.addSubview(titleLabel)
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 5),
            titleLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.trailingAnchor),
        ])
    }
    
    /*
     Only override draw() if you perform custom drawing.
     An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
         Drawing code
    }
    */
}

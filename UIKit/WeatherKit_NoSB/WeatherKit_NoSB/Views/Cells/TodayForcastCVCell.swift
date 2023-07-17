//
//  TodayForcastViewCell.swift
//  WeatherKit_NoSB
//
//  Created by gnksbm on 2023/07/16.
//

import UIKit


class TodayForcastCVCell: UICollectionViewCell {
    static let identifier = "TodayForcastCVCell"
    
    var forcastData = TodayForcast(time: "지금", image: UIImage(systemName: "umbrella.fill"), degree: "22°")
    
    //MARK: - View
    
    lazy var timeLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: .littleWeatherFont)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var forcastImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.tintColor = .white
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    lazy var degreeLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: .smallWeatherFont)
        label.text = forcastData.degree
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    //MARK: - init

    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
        configureData()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - func

    func configureUI() {
        contentView.backgroundColor = .clear
        setForcastImageView()
        setTimeLabel()
        setDegreeLabel()
    }
    
    func configureData() {
        timeLabel.text = forcastData.time
        forcastImageView.image = forcastData.image
        degreeLabel.text = forcastData.degree
    }
    
    func setTimeLabel() {
        contentView.addSubview(timeLabel)
        
        NSLayoutConstraint.activate([
            timeLabel.bottomAnchor.constraint(equalTo: forcastImageView.topAnchor, constant: -10),
            timeLabel.heightAnchor.constraint(equalToConstant: .littleWeatherFont),
            timeLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
        ])
    }
    
    func setForcastImageView() {
        contentView.addSubview(forcastImageView)
        
        NSLayoutConstraint.activate([
            forcastImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            forcastImageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            forcastImageView.widthAnchor.constraint(equalToConstant: .littleWeatherFont + 10),
            forcastImageView.heightAnchor.constraint(equalToConstant: .littleWeatherFont + 10),
        ])
    }
    
    func setDegreeLabel() {
        contentView.addSubview(degreeLabel)
        
        NSLayoutConstraint.activate([
            degreeLabel.topAnchor.constraint(equalTo: forcastImageView.bottomAnchor, constant: 10),
            degreeLabel.heightAnchor.constraint(equalToConstant: .littleWeatherFont),
            degreeLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
        ])
    }
}

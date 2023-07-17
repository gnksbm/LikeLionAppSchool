//
//  DailyForcastTVCell.swift
//  WeatherKit_NoSB
//
//  Created by gnksbm on 2023/07/17.
//

import UIKit

class DailyForcastTVCell: UITableViewCell {
    static let identifier = "DailyForcastTVCell"
    
    var forcastData = DailyForcast(day: "오늘", image: UIImage(systemName: "cloud.rain.fill"), highDegree: "28°", lowDegree: "22°")
    
    //MARK: - View
    
    lazy var dayLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: .smallWeatherFont)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var forcastImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.tintColor = .white
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    lazy var highDegreeLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: .smallWeatherFont)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var degreeProgressView: UIProgressView = {
        let view = UIProgressView()
        view.trackTintColor = .separator
            /// progress 진행 색상
        view.progressTintColor = .orange
        view.progress = 0.1
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var lowDegreeLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: .smallWeatherFont)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    //MARK: - init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureUI()
        configureData()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - func
    func configureUI() {
        self.backgroundColor = .clear
        setDayLabel()
        setForcastImageView()
        setHighDegreeLabel()
        setProgressView()
        setLowDegreeLabel()
    }
    
    func configureData() {
        dayLabel.text = forcastData.day
        forcastImageView.image = forcastData.image
        lowDegreeLabel.text = forcastData.lowDegree
        highDegreeLabel.text = forcastData.highDegree
    }
    
    func setDayLabel() {
        contentView.addSubview(dayLabel)
        
        NSLayoutConstraint.activate([
            dayLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
            dayLabel.heightAnchor.constraint(equalToConstant: .smallWeatherFont),
            dayLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
        ])
    }
    
    func setForcastImageView() {
        contentView.addSubview(forcastImageView)
        
        NSLayoutConstraint.activate([
            forcastImageView.leadingAnchor.constraint(equalTo: dayLabel.trailingAnchor, constant: 15),
            forcastImageView.widthAnchor.constraint(equalToConstant: .smallWeatherFont + 4),
            forcastImageView.heightAnchor.constraint(equalToConstant: .smallWeatherFont + 4),
            forcastImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
        ])
    }
    
    func setHighDegreeLabel() {
        contentView.addSubview(highDegreeLabel)
        
        NSLayoutConstraint.activate([
            highDegreeLabel.leadingAnchor.constraint(equalTo: forcastImageView.trailingAnchor, constant: 15),
            highDegreeLabel.heightAnchor.constraint(equalToConstant: .smallWeatherFont),
            highDegreeLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
        ])
    }
    
    func setProgressView() {
        contentView.addSubview(degreeProgressView)
        
        NSLayoutConstraint.activate([
            degreeProgressView.leadingAnchor.constraint(equalTo: highDegreeLabel.trailingAnchor, constant: 15),
            degreeProgressView.widthAnchor.constraint(equalToConstant: .screenWidth / 3.5),
            degreeProgressView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
        ])
    }
    
    func setLowDegreeLabel() {
        contentView.addSubview(lowDegreeLabel)
        
        NSLayoutConstraint.activate([
            lowDegreeLabel.leadingAnchor.constraint(equalTo: degreeProgressView.trailingAnchor, constant: 15),
            lowDegreeLabel.heightAnchor.constraint(equalToConstant: .smallWeatherFont),
            lowDegreeLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
        ])
    }
}

//
//  MainForcastDataView.swift
//  WeatherKit_NoSB
//
//  Created by gnksbm on 2023/07/17.
//

import UIKit

class MainForcastDataView: UIView {
    let forcastData = MainForcast(lacation: "청주시", realtimeDegree: "23°", forcast: "이슬비", highDegree: "최고:28°", lowDegree: "최저:22°")
    //MARK: - View
    
    lazy var locationLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: .mediumWeatherFont)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var realTimeDegreeLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: .largeWeatherFont, weight: .thin)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var forcastLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: .smallWeatherFont)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var highDegreeLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: .smallWeatherFont)
        label.textAlignment = .right
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var lowDegreeLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: .smallWeatherFont)
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
        configureData()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureUI() {
        setRTDegreeLabel()
        setForcastLabel()
        setLocationLabel()
        setHighDegreeLabel()
        setLowDegreeLabel()
    }
    
    func configureData() {
        locationLabel.text = forcastData.lacation
        realTimeDegreeLabel.text = forcastData.realtimeDegree
        forcastLabel.text = forcastData.forcast
        highDegreeLabel.text = forcastData.highDegree
        lowDegreeLabel.text = forcastData.lowDegree
    }
    
    func setLocationLabel() {
        self.addSubview(locationLabel)
        
        NSLayoutConstraint.activate([
            locationLabel.heightAnchor.constraint(equalToConstant: .mediumWeatherFont),
            locationLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            locationLabel.bottomAnchor.constraint(equalTo: realTimeDegreeLabel.topAnchor),
        ])
    }
    
    func setRTDegreeLabel() {
        self.addSubview(realTimeDegreeLabel)
        
        NSLayoutConstraint.activate([
            realTimeDegreeLabel.heightAnchor.constraint(equalToConstant: .largeWeatherFont),
            realTimeDegreeLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: 10),
            realTimeDegreeLabel.bottomAnchor.constraint(equalTo: self.centerYAnchor, constant: 70),
        ])
    }
    
    func setForcastLabel() {
        self.addSubview(forcastLabel)
        
        NSLayoutConstraint.activate([
            forcastLabel.heightAnchor.constraint(equalToConstant: .smallWeatherFont),
            forcastLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            forcastLabel.topAnchor.constraint(equalTo: self.centerYAnchor, constant: 75),
        ])
    }
    
    func setHighDegreeLabel() {
        self.addSubview(highDegreeLabel)
        
        NSLayoutConstraint.activate([
            highDegreeLabel.heightAnchor.constraint(equalToConstant: .smallWeatherFont),
            highDegreeLabel.trailingAnchor.constraint(equalTo: self.centerXAnchor, constant: -5),
            highDegreeLabel.topAnchor.constraint(equalTo: forcastLabel.bottomAnchor, constant: 10),
        ])
    }
    func setLowDegreeLabel() {
        self.addSubview(lowDegreeLabel)
        
        NSLayoutConstraint.activate([
            lowDegreeLabel.heightAnchor.constraint(equalToConstant: .smallWeatherFont),
            lowDegreeLabel.leadingAnchor.constraint(equalTo: self.centerXAnchor, constant: 5),
            lowDegreeLabel.topAnchor.constraint(equalTo: forcastLabel.bottomAnchor, constant: 10),
        ])
    }
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}

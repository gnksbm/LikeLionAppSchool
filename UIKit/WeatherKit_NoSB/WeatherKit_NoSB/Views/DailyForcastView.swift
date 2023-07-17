//
//  DailyForcastView.swift
//  WeatherKit_NoSB
//
//  Created by gnksbm on 2023/07/17.
//

import UIKit

class DailyForcastView: UIView {
    lazy var dailyForcastTV: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .clear
        tableView.sectionHeaderHeight = UITableView.automaticDimension
        tableView.sectionHeaderTopPadding = 10
        tableView.showsVerticalScrollIndicator = false
        tableView.isScrollEnabled = false
        tableView.register(DailyForcastTVCell.self, forCellReuseIdentifier: DailyForcastTVCell.identifier)
        tableView.register(WeatherHeaderView.self, forHeaderFooterViewReuseIdentifier: WeatherHeaderView.identifier)
        tableView.dataSource = self
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureUI() {
        self.backgroundColor = .clear
        setDailyForcastCV()
    }
    func setDailyForcastCV() {
        self.addSubview(dailyForcastTV)
        
        NSLayoutConstraint.activate([
            dailyForcastTV.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            dailyForcastTV.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            dailyForcastTV.topAnchor.constraint(equalTo: self.topAnchor),
            dailyForcastTV.bottomAnchor.constraint(equalTo: self.bottomAnchor),
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

extension DailyForcastView: UITableViewDataSource {
    //MARK: - mainTableView: Section
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    
    //MARK: -mainTableView: Cell
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        7
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: DailyForcastTVCell.identifier) as! DailyForcastTVCell
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        .dailyTVCellHeight
    }
}

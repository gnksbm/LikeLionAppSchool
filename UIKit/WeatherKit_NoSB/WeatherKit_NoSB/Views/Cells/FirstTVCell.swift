//
//  FirstTVCell.swift
//  WeatherKit_NoSB
//
//  Created by gnksbm on 2023/07/22.
//

import UIKit

class FirstTVCell: MainBlurTVCell {

    static let identifier = "FirstTVCell"
    
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
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        drawFullScreenAutoLayout(view: dailyForcastTV, targetView: contentView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension FirstTVCell: UITableViewDataSource {
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

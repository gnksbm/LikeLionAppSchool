//
//  ViewController.swift
//  WeatherKit_NoSB
//
//  Created by gnksbm on 2023/07/16.
//

import UIKit



class ViewController: UIViewController {
    private var headerHeightConstraint: NSLayoutConstraint?
    
    let forcastData = MainForcast(lacation: "청주시", realtimeDegree: "23°", forcast: "이슬비", highDegree: "최고:28°", lowDegree: "최저:22°")
    //MARK: - View
    lazy var cloudView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "cloud2")
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var forcastDataView: MainForcastDataView = {
        let view = MainForcastDataView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var mainTableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .clear
        tableView.sectionHeaderHeight = UITableView.automaticDimension
        tableView.sectionHeaderTopPadding = 10
        tableView.showsVerticalScrollIndicator = false
        tableView.register(MainBlurTVCell.self, forCellReuseIdentifier: MainBlurTVCell.identifier)
        tableView.register(WeatherHeaderView.self, forHeaderFooterViewReuseIdentifier: WeatherHeaderView.identifier)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    //MARK: - lifeCicle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    //MARK: - func
    func configureUI() {
        setCloudView()
        setTableView()
        setForcastDataView()
        
    }
    
    func setCloudView() {
        view.addSubview(cloudView)
        
        NSLayoutConstraint.activate([
            cloudView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            cloudView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            cloudView.topAnchor.constraint(equalTo: view.topAnchor),
            cloudView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
    
    func setForcastDataView() {
        view.addSubview(forcastDataView)
        
        headerHeightConstraint = forcastDataView.heightAnchor.constraint(equalToConstant: .headerHeight)
        headerHeightConstraint?.isActive = true
        NSLayoutConstraint.activate([
            forcastDataView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: .screenWidth / 16),
            forcastDataView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: .screenWidth / -16),
            forcastDataView.topAnchor.constraint(equalTo: view.topAnchor),
        ])
    }
    
    func setTableView() {
        view.addSubview(mainTableView)
        
        NSLayoutConstraint.activate([
            mainTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: .screenWidth / 16),
            mainTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: .screenWidth / -16),
                                                                            //    headerHeight * 0.42
            mainTableView.topAnchor.constraint(equalTo: view.topAnchor, constant: .headerHeight),
//            mainTableView.topAnchor.constraint(equalTo: forcastDataView.bottomAnchor),
            mainTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
}
//MARK: - mainTableView
extension ViewController: UITableViewDataSource {
    //MARK: - mainTableView: Section
    func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
    
    //MARK: - mainTableView: Header
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let view = tableView.dequeueReusableHeaderFooterView(withIdentifier: WeatherHeaderView.identifier) as? WeatherHeaderView else { return nil }
        switch section {
        case 0:
            view.imageView.image = UIImage(systemName: "clock")
            view.titleLabel.text = "시간별 일기예보"
        case 1:
            view.imageView.image = UIImage(systemName: "calendar")
            view.titleLabel.text = "10일간의 일기예보"
        case 2:
            view.imageView.image = UIImage(systemName: "aqi.medium")
            view.titleLabel.text = "대기질"
        case 3:
            view.imageView.image = UIImage(systemName: "umbrella.fill")
            view.titleLabel.text = "강수량"
        default:
            return nil
        }
        return view
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        40
    }
    
    //MARK: -mainTableView: Cell
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MainBlurTVCell.identifier) as? MainBlurTVCell else { return UITableViewCell() }
        cell.contentView.layer.masksToBounds = true
        cell.contentView.layer.cornerRadius = 15
        cell.contentView.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        switch indexPath.section {
        case 0:
            let todayForcastCV = TodayForcastView(frame: .zero)
            todayForcastCV.translatesAutoresizingMaskIntoConstraints = false
            cell.addSubview(todayForcastCV)

            NSLayoutConstraint.activate([
                todayForcastCV.leadingAnchor.constraint(equalTo: cell.leadingAnchor),
                todayForcastCV.trailingAnchor.constraint(equalTo: cell.trailingAnchor),
                todayForcastCV.topAnchor.constraint(equalTo: cell.topAnchor),
                todayForcastCV.bottomAnchor.constraint(equalTo: cell.bottomAnchor),
            ])
        case 1:
            let dailyForcastCV = DailyForcastView(frame: .zero)
            dailyForcastCV.translatesAutoresizingMaskIntoConstraints = false
            cell.addSubview(dailyForcastCV)

            NSLayoutConstraint.activate([
                dailyForcastCV.leadingAnchor.constraint(equalTo: cell.leadingAnchor),
                dailyForcastCV.trailingAnchor.constraint(equalTo: cell.trailingAnchor),
                dailyForcastCV.topAnchor.constraint(equalTo: cell.topAnchor),
                dailyForcastCV.bottomAnchor.constraint(equalTo: cell.bottomAnchor),
            ])
        default:
            break
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0:
            return .todayForcastCellHeight + 5
        case 1:
            return .dailyTVCellHeight * 7
        default:
            return 300
        }
    }
}

extension ViewController: UITableViewDelegate {
//    tableview
//    func scrollViewDidScroll(_ scrollView: UIScrollView) {
//        guard let constraint = headerHeightConstraint else { return }
//        print(scrollView.contentOffset.y)
////        print(scrollView)
//
//        let remainingTopSpacing = abs(scrollView.contentOffset.y)
//        let lowerThanTop = scrollView.contentOffset.y < 100
//        let stopExpandHeaderHeight = scrollView.contentOffset.y > -CGFloat.headerHeight
//
//        if stopExpandHeaderHeight, lowerThanTop {
//            // 1) 초기 상태: UIImageView가 지정한 크기만큼 커졌고, 스크롤뷰의 시작점이 최상단보다 아래 존재
//            mainTableView.contentInset = .init(top: remainingTopSpacing, left: 0, bottom: 0, right: 0)
//            constraint.constant = remainingTopSpacing
//            forcastDataView.alpha = remainingTopSpacing / CGFloat.headerHeight
//            view.layoutIfNeeded()
//        } else if !lowerThanTop {
//            // 2) 스크롤 뷰의 시작점이 최상단보다 위에 존재
//            mainTableView.contentInset = .zero
//            constraint.constant = 0
//            forcastDataView.alpha = 0
//        } else {
//            // 3) 스크롤 뷰의 시작점이 최상단보다 밑에 있고, 스크롤뷰 상단 contentInset이 미리 지정한 UIImageView 높이인, Metric.headerHeight보다 큰 경우
//            constraint.constant = remainingTopSpacing
//            forcastDataView.alpha = 1
//        }
//    }
}

//MARK: - TodayForcastTVCell

extension ViewController: UICollectionViewDataSource {
    //MARK: - TodayForcastTVCell: Section
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        24
    }
    //MARK: - TodayForcastTVCell: Cell
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TodayForcastCVCell.identifier, for: indexPath) as! TodayForcastCVCell
        return cell
    }
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    //MARK: - TodayForcastTVCell: CellSize
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: .todayForcastCellWidth, height: .todayForcastCellHeight)
    }
}

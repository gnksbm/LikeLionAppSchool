//
//  SearchResultVC.swift
//  APIServiceMVCKit
//
//  Created by gnksbm on 2023/09/03.
//

import UIKit

class SearchResultVC: UIViewController {
    var metro: Metro? {
        didSet {
            updateSnapshot()
        }
    }
    var dataSource: UITableViewDiffableDataSource<Int, String>!
    var snapshot: NSDiffableDataSourceSnapshot<Int, String>!
    
    lazy var resultTV: UITableView = {
        let tv = UITableView()
        tv.register(ArrivalInfoTVCell.self, forCellReuseIdentifier: ArrivalInfoTVCell.identifier)
        return tv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemTeal
        configureUI()
        configureDataSource()
    }
    
    func configureUI() {
        resultTV.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(resultTV)
        
        let safeArea = view.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            resultTV.topAnchor.constraint(equalTo: safeArea.topAnchor),
            resultTV.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor),
            resultTV.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor),
            resultTV.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor),
        ])
    }
}

extension SearchResultVC {
    func configureDataSource() {
        dataSource = .init(tableView: resultTV, cellProvider: { tableView, indexPath, itemIdentifier in
            let cell = tableView.dequeueReusableCell(withIdentifier: ArrivalInfoTVCell.identifier, for: indexPath) as! ArrivalInfoTVCell
            cell.label.text = itemIdentifier
            return cell
        })
    }
    
    func updateSnapshot() {
        snapshot = .init()
        snapshot.appendSections([0])
        if let metro {
            snapshot.appendItems(metro.realtimePositionList.map(\.statnNm))
        }
        dataSource.apply(snapshot)
    }
}

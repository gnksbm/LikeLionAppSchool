//
//  RootVC.swift
//  CoreDataKit
//
//  Created by gnksbm on 2023/12/14.
//  Copyright © 2023 gnksbm. All rights reserved.
//

import UIKit
import CoreData

final class RootVC: UIViewController {
    private let rootView = RootView()
    
    var memoList: [Memo] = [
        .init(content: "Mock", date: .now),
        .init(content: "Mock", date: .init(timeInterval: -86400, since: .now))
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        rootView.memoTableView.dataSource = self
        configureUI()
    }
    
    private func configureUI() {
        view.addSubview(rootView)
        rootView.translatesAutoresizingMaskIntoConstraints = false
        
        let safeArea = view.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            rootView.topAnchor.constraint(equalTo: safeArea.topAnchor),
            rootView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor),
            rootView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor),
            rootView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor),
        ])
    }
}

extension RootVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        memoList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: MemoTVCell.id,
            for: indexPath
        ) as! MemoTVCell
        cell.configureUIWithData(memoList[indexPath.row])
        return cell
    }
}

#if DEBUG
import SwiftUI
struct RootVC_Preview: PreviewProvider {
    static var previews: some View {
        UIKitPreview {
            RootVC()
        }
    }
}
#endif

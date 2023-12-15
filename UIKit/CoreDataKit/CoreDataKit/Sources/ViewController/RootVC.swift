//
//  RootVC.swift
//  CoreDataKit
//
//  Created by gnksbm on 2023/12/14.
//  Copyright © 2023 gnksbm. All rights reserved.
//

import UIKit

final class RootVC: UIViewController {
    private let coreDataService = CoreDataService(
        containerName: "Model",
        entityName: "MemoEntity"
    )
    
    private var memoList: [Memo] = [
//        .init(content: "Mock", date: .now),
//        .init(content: "Mock", date: .init(timeInterval: -86400, since: .now))
    ]
    
    private let rootView = RootView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        manageComponents()
        configureUI()
        fetchMemoList()
        guard let memo = memoList.first else { return }
        removeMemo(memo: memo)
    }
    
    private func manageComponents() {
        rootView.memoTableView.dataSource = self
        rootView.saveBtn.addTarget(
            self,
            action: #selector(saveBtnTapped),
            for: .touchUpInside
        )
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
    
    private func fetchMemoList() {
        memoList = coreDataService.fetchContext()
            .compactMap { ($0 as? MemoEntity)?.toModel }.sorted(by: { $0.date > $1.date })
        rootView.memoTableView.reloadData()
    }
    
    @objc private func saveBtnTapped() {
        guard let content = rootView.textField.text,
              !content.isEmpty
        else { return }
        coreDataService.saveContext(memo: .init(content: content))
        rootView.textField.text = nil
        fetchMemoList()
    }
    
    private func removeMemo(memo: Memo) {
        coreDataService.remove(memo: memo)
        fetchMemoList()
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

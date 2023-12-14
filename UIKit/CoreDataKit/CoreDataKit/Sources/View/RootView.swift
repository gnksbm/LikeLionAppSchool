//
//  RootView.swift
//  CoreDataKit
//
//  Created by gnksbm on 2023/12/14.
//  Copyright © 2023 gnksbm. All rights reserved.
//

import UIKit

final class RootView: UIView {
    let textField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "메모를 입력하세요."
        return tf
    }()
    
    let saveBtn: UIButton = {
        var config = UIButton.Configuration.plain()
        config.title = "저장"
        config.cornerStyle = .fixed
        config.background.backgroundColor = .secondaryLabel
        config.baseForegroundColor = .white
        let btn = UIButton(configuration: config)
        return btn
    }()
    
    lazy var memoTableView: UITableView = {
        let tv = UITableView()
        tv.layer.borderWidth = 1
        tv.register(MemoTVCell.self, forCellReuseIdentifier: MemoTVCell.id)
        return tv
    }()
    
    convenience init() {
        self.init(frame: .zero)
        configureUI()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureUI() {
        [textField, saveBtn, memoTableView].forEach {
            self.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        NSLayoutConstraint.activate([
            textField.topAnchor.constraint(
                equalTo: self.topAnchor,
                constant: 10
            ),
            textField.leadingAnchor.constraint(
                equalTo: self.leadingAnchor,
                constant: 10
            ),
            textField.widthAnchor.constraint(
                equalTo: self.widthAnchor,
                multiplier: 0.7
            ),
            textField.heightAnchor.constraint(equalToConstant: 30),
            
            saveBtn.topAnchor.constraint(equalTo: textField.topAnchor),
            saveBtn.leadingAnchor.constraint(
                equalTo: textField.trailingAnchor,
                constant: 10
            ),
            saveBtn.trailingAnchor.constraint(
                equalTo: self.trailingAnchor,
                constant: -10
            ),
            saveBtn.heightAnchor.constraint(equalTo: textField.heightAnchor),
            
            memoTableView.topAnchor.constraint(
                equalTo: textField.bottomAnchor,
                constant: 10
            ),
            memoTableView.leadingAnchor.constraint(
                equalTo: self.leadingAnchor,
                constant: 10
            ),
            memoTableView.trailingAnchor.constraint(
                equalTo: self.trailingAnchor,
                constant: -10
            ),
            memoTableView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
        ])
    }
}

#if DEBUG
import SwiftUI
struct RootView_Preview: PreviewProvider {
    static var previews: some View {
        UIKitPreview {
            RootVC()
        }
    }
}
#endif

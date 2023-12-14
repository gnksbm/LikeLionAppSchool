//
//  MemoTVCell.swift
//  CoreDataKit
//
//  Created by gnksbm on 2023/12/14.
//  Copyright © 2023 gnksbm. All rights reserved.
//

import UIKit

class MemoTVCell: UITableViewCell {
    static let id = String(describing: MemoTVCell.self)
    
    let contentTextView: UITextView = {
        let textView = UITextView()
        textView.isEditable = false
        textView.font = .systemFont(ofSize: 20)
        return textView
    }()
    
    let dateLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        resetData()
    }
    
    private func configureUI() {
        [contentTextView, dateLabel].forEach {
            contentView.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        NSLayoutConstraint.activate([
            contentTextView.topAnchor.constraint(equalTo: contentView.topAnchor),
            contentTextView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            contentTextView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            contentTextView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            dateLabel.trailingAnchor.constraint(
                equalTo: contentView.trailingAnchor,
                constant: -10
            ),
            dateLabel.bottomAnchor.constraint(
                equalTo: contentView.bottomAnchor,
                constant: -10
            ),
        ])
    }
    
    func configureUIWithData(_ data: Memo) {
        contentTextView.text = data.content
        dateLabel.text = data.date.formatted(.relative(presentation: .named))
    }
    
    private func resetData() {
        contentTextView.text = nil
        dateLabel.text = nil
    }
}

#if DEBUG
import SwiftUI
struct MemoTVCell_Preview: PreviewProvider {
    static var previews: some View {
        UIKitPreview {
            RootVC()
        }
    }
}
#endif

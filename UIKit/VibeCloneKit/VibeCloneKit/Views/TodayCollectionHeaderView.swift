//
//  TodayCollectionHeaderView.swift
//  VibeCloneKit
//
//  Created by gnksbm on 2023/08/12.
//

import UIKit

class TodayCollectionHeaderView: UICollectionReusableView {
    let customLabel: UILabel = {
        let label = UILabel()
        label.text = "헤더"
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func drawLabel() {
        customLabel.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(customLabel)
        customLabel.setSuperviewAnchor(anchor: .top)
        customLabel.setSuperviewAnchor(anchor: .lead)
    }
}

//
//  Extension+UIView.swift
//  CompositionalCollectionViewKit
//
//  Created by gnksbm on 2023/08/11.
//

import UIKit

extension UIView {
    enum Anchor: CaseIterable {
        case top, btm, lead, trail
    }
    
    func fitSuperView() {
        Anchor.allCases.forEach {
            fitSuperviewAnchor(anchor: $0)
        }
    }
    
    func fitSuperviewAnchor(anchor: Anchor) {
        guard let superview else { return }
        getConstraint(equalTo: superview, anchor: anchor).isActive = true
    }
    
    func fitSuperviewAnchor(anchor: Anchor, constant: CGFloat) {
        guard let superview else { return }
        getConstraint(equalTo: superview, anchor: anchor).isActive = true
    }
    
    func getConstraint(superView: UIView, anchor: Anchor, constant: CGFloat) -> NSLayoutConstraint {
        let constraint = getConstraint(equalTo: superView, anchor: anchor)
        constraint.constant = constant
        return constraint
    }
    
    func getConstraint(equalTo superView: UIView, anchor: Anchor) -> NSLayoutConstraint {
        let safeArea = superView.safeAreaLayoutGuide
        switch anchor {
        case .top:
            return topAnchor.constraint(equalTo: safeArea.topAnchor)
        case .btm:
            return bottomAnchor.constraint(equalTo: safeArea.bottomAnchor)
        case .lead:
            return leadingAnchor.constraint(equalTo: safeArea.leadingAnchor)
        case .trail:
            return trailingAnchor.constraint(equalTo: safeArea.trailingAnchor)
        }
    }
}

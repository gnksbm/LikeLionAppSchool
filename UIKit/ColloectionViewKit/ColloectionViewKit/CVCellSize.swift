//
//  CVCellSize.swift
//  ColloectionViewKit
//
//  Created by gnksbm on 2023/07/26.
//

import UIKit

struct CVCellSize {
    let rows: CGFloat
    let columns: CGFloat
    let spacing: CGFloat
    var lineSpacing: CGFloat?
    var inset: UIEdgeInsets
    var height: CGFloat?
    var width: CGFloat {
        (UIScreen.main.bounds.width - (spacing * (columns - 1) + inset.left + inset.right)) / columns
    }
    var viewHeight: CGFloat {
        ((height ?? width) * rows) + ((lineSpacing ?? spacing) * (rows - 1)) + inset.top + inset.bottom
    }
    
    init(rows: CGFloat, columns: CGFloat, spacing: CGFloat, rowSpacing: CGFloat? = nil, insetTop: CGFloat, insetLeft: CGFloat, insetBottom: CGFloat, insetRight: CGFloat, height: CGFloat? = nil) {
        self.rows = rows
        self.columns = columns
        self.spacing = spacing
        self.lineSpacing = rowSpacing
        self.inset = UIEdgeInsets(top: insetTop, left: insetLeft, bottom: insetBottom, right: insetRight)
        self.height = height
    }
}

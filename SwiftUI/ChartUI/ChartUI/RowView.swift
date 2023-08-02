//
//  RowView.swift
//  ChartUI
//
//  Created by gnksbm on 2023/07/31.
//

import SwiftUI

struct RowView: View {
    let word: String
    let width: CGFloat
    var body: some View {
        HStack {
            Image(systemName: "person")
            Text(word)
                .font(.caption)
                .font(.title)
                .fontWeight(.bold)
                .fixedSize()
            Spacer()
        }
    }
}

struct RowView_Previews: PreviewProvider {
    static var previews: some View {
        RowView(word: "Test", width: 300)
    }
}

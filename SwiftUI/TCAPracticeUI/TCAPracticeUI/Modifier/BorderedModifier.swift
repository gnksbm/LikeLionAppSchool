//
//  BorderedModifier.swift
//  TCAPracticeUI
//
//  Created by gnksbm on 2023/09/15.
//

import SwiftUI

struct CustomBox: ViewModifier {
    func body(content: Content) -> some View {
        content
            .foregroundColor(.red)
            .background(.pink)
    }
}
struct BorderedCaption: ViewModifier {
    func body(content: Content) -> some View {
        content
            .bold()
            .padding(10)
            .overlay(
                RoundedRectangle(cornerRadius: 15)
                    .stroke(lineWidth: 1)
            )
            .foregroundColor(Color.blue)
    }
}

extension View {
    func borderedCaption() -> some View {
        modifier(BorderedCaption())
    }
    func customBox() -> some View {
        modifier(CustomBox())
    }
}

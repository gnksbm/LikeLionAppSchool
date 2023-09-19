//
//  PreferenceView.swift
//  ZenoPrototypeUI
//
//  Created by gnksbm on 2023/09/20.
//

import SwiftUI

struct PreferenceView: View {
    var body: some View {
        List {
            ForEach(0..<5) { index in
                NavigationLink {
                    
                } label: {
                    Text("\(index)번째 설정")
                }
            }
        }
    }
}

struct PreferenceView_Previews: PreviewProvider {
    static var previews: some View {
        PreferenceView()
    }
}

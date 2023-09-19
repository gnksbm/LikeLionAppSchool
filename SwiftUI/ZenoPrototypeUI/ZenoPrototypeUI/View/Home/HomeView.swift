//
//  HomeView.swift
//  ZenoPrototypeUI
//
//  Created by gnksbm on 2023/09/20.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationStack {
            List {
                ForEach(0..<8, id: \.self) { index in
                    NavigationLink {
                        GroupView()
                    } label: {
                        HStack {
                            Text("\(index)번째 모임")
                            Spacer()
                            if index == 0 {
                                Image(systemName: "3.circle.fill")
                                    .foregroundColor(.red)
                            }
                            if index == 2 {
                                Image(systemName: "21.circle.fill")
                                    .foregroundColor(.red)
                            }
                        }
                    }
                }
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

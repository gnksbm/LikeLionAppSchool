//
//  GroupVoteCellView.swift
//  ZenoPrototypeUI
//
//  Created by gnksbm on 2023/09/20.
//

import SwiftUI

struct GroupVoteCellView: View {
    var body: some View {
        GroupBox {
            VStack(alignment: .leading) {
                HStack {
                    Group {
                        Image(systemName: "person")
                        Text("익명의 누군가, 남자")
                    }
                    .font(.headline)
                    Spacer()
                    Text("10분전")
                }
                .padding()
                Text("Tuna님은 요리 잘할 것 같은 남자")
                    .font(.title2)
                    .padding()
            }
        }
        .padding()
    }
}

struct MyVoteCellView_Previews: PreviewProvider {
    static var previews: some View {
        GroupVoteCellView()
    }
}

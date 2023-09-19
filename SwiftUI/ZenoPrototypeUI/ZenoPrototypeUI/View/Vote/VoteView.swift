//
//  VoteView.swift
//  ZenoPrototypeUI
//
//  Created by gnksbm on 2023/09/20.
//

import SwiftUI

struct VoteView: View {
    var body: some View {
        VStack(alignment: .center) {
            ProgressView(value: 2, total: 12) {
                Text("2")
            }
            .padding()
            Spacer()
            Text("요리를 잘할 것 같은 사람")
                .font(.system(size: 35, weight: .heavy))
                .padding()
            LazyVGrid(columns: Array(repeating: GridItem(), count: 2)) {
                ForEach(0..<4) { index in
                    Button {
                        
                    } label: {
                        HStack {
                            Image(systemName: "person.circle")
                            Text("사람\(index)")
                        }
                    }
                    .padding()
                    .font(.title3)
                    .foregroundStyle(.background)
                    .background(.secondary)
                    .cornerRadius(5)
                    .padding()
                }
            }
            Button {
                
            } label: {
                HStack {
                    Image(systemName: "arrow.clockwise.circle.fill")
                    Text("새로고침")
                }
                .font(.title)
                .foregroundColor(.primary)
            }
        }
        .padding()
    }
}

struct VoteView_Previews: PreviewProvider {
    static var previews: some View {
        VoteView()
    }
}

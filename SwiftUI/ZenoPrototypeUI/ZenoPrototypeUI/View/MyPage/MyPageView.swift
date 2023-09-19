//
//  MyPageView.swift
//  ZenoPrototypeUI
//
//  Created by gnksbm on 2023/09/20.
//

import SwiftUI

enum Icon: Int, CaseIterable {
    case friend, picked, cash
    
    var imageName: String {
        switch self {
        case .friend:
            return "person"
        case .picked:
            return "crown"
        case .cash:
            return "dollarsign.circle"
        }
    }
    var count: Int {
        switch self {
        case .friend:
            return 6
        case .picked:
            return 37
        case .cash:
            return 20
        }
    }
}

struct MyPageView: View {
    var body: some View {
        NavigationStack {
            VStack {
                HStack {
                    Image(systemName: "person.circle")
                        .font(.system(size: 150))
                    LazyVGrid(columns: Array(repeating: GridItem(), count: 3)) {
                        ForEach(0..<3) { index in
                            VStack {
                                Image(systemName: Icon(rawValue: index)?.imageName ?? "person")
                                Text("\(Icon(rawValue: index)?.count ?? 0)")
                            }
                            .font(.title)
                        }
                    }
                }
                HStack(spacing: 20) {
                    Text("유민영")
                    Spacer()
                    Button {
                        
                    } label: {
                        Image(systemName: "gearshape")
                    }
                    Button {
                        
                    } label: {
                        Image(systemName: "link")
                    }
                }
                .font(.title)
                .padding()
                HStack {
                    Text("많이 받은 질문")
                    Spacer()
                }
                .font(.title)
                .bold()
                .padding()
                ForEach(1..<4) { index in
                    HStack(spacing: 10) {
                        Image(systemName: "\(index).circle")
                        Text("요리를 잘할 것 같은 사람")
                        Spacer()
                    }
                    .padding()
                    .overlay {
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(.primary, lineWidth: 1)
                    }
                }
            }
            .padding()
        }
        
    }
}

struct MyPageView_Previews: PreviewProvider {
    static var previews: some View {
        MyPageView()
    }
}

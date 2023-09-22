//
//  TCAView.swift
//  TCAPracticeUI
//
//  Created by gnksbm on 2023/09/15.
//

import SwiftUI
import ComposableArchitecture

struct TCAView: View {
    let store: StoreOf<NameStore>
    @State private var change: String = ""
    
    var body: some View {
        WithViewStore(self.store, observe: { $0 }) { viewStore in
            VStack(alignment: .center) {
                Group {
                    Text("Hello, \(viewStore.name)")
                    TextField("변경할 이름", text: $change)
                }
                HStack {
                    Group {
                        Button("이름 변경") {
                            viewStore.send(.change(name: change))
                        }
                        Button("리셋") {
                            viewStore.send(.reset)
                        }
                    }
                }
            }
            .padding()
        }
    }
}

struct TCAView_Previews: PreviewProvider {
    static var previews: some View {
        TCAView(
            store: Store(initialState: NameStore.State()) {
                NameStore()
            }
        )
    }
}

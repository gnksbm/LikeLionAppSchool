//
//  TCAView.swift
//  TCAPracticeUI
//
//  Created by gnksbm on 2023/09/15.
//

import SwiftUI
import ComposableArchitecture

struct TCAView: View {
    @StateObject private var nameVM: NameViewModel = .init()
    
    var body: some View {
        VStack(alignment: .center) {
            Group {
                Text("Hello, \(nameVM.name)")
                TextField("변경할 이름", text: $change)
            }
            HStack {
                Group {
                    Button("이름 변경") {
                        nameVM.changeName(name: change)
                    }
                    Button("리셋") {
                        nameVM.resetName()
                    }
                }
            }
        }
        .padding()
        
        
        
        
        
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
                            viewStore.send(.print)
                        }
                    }
                }
            }
            .padding()
        }
    }
    
    let store: StoreOf<NameStore>
    @State private var change: String = ""
    
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

//
//  SwiftUIView.swift
//  StudentUI
//
//  Created by gnksbm on 2023/06/14.
//

import SwiftUI

struct CounterView: View {
    // @State가 있기 때문에, count의 값이 바뀔때마다
    // body를 새로 그려준다
    @State var count: Int = 0
    
    var body: some View {
        // body 안에는 뭐라도 View에 대항하는 게
        // 크게 보면 딱 하나만 존재해야한다
        VStack {
            Text("Counter")
                .padding()
            
            Text("\(count)")
                .padding()
            
            HStack {
                Button {
                    // action
                    print("Up~!")
                    
                    count += 1
                } label: {
                    // label
                    Text("Up")
                        .padding()
                }

                Button {
                    print("Down! @@")
                    
                    count -= 1
                } label: {
                    Text("Down")
                        .padding()
                }
            }
            HStack {
                Button {
                    // action
                    print("Up X 10~!")
                    
                    count += 10
                } label: {
                    // label
                    Text("Up X 10")
                        .padding()
                }

                Button {
                    print("Down X 10! @@")
                    
                    count -= 10
                } label: {
                    Text("Down X 10")
                        .padding()
                }
            }
            Button("Reset") {
                count = 0
            }
        }
        .font(.largeTitle)
    }
}

struct CounterView_Previews: PreviewProvider {
    static var previews: some View {
        CounterView()
    }
}

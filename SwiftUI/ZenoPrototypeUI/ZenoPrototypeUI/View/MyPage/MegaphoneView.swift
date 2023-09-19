//
//  MegaphoneView.swift
//  ZenoPrototypeUI
//
//  Created by gnksbm on 2023/09/20.
//

import SwiftUI

struct MegaphoneView: View {
    @State private var users: [String] = [
        "0번째 모임",
        "1번째 모임",
        "2번째 모임",
        "3번째 모임",
        "4번째 모임",
        "5번째 모임",
        "6번째 모임",
    ]
    @State private var selection: String = "0번째 모임"
    @State private var tfText: String = ""
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading) {
                Text("모임")
                Picker(selection: $selection) {
                    ForEach(users, id: \.self) { user in
                        Text(user)
                    }
                } label: {
                    Text(selection)
                }
                .pickerStyle(.menu)
                Text("내용")
                TextField("", text: $tfText)
                    .textFieldStyle(.roundedBorder)
                    .shadow(radius: 2)
                Spacer()
            }
            .padding()
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("취소") {
                        
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("메가폰 발사") {
                        
                    }
                }
            }
        }
    }
}

struct MegaphoneView_Previews: PreviewProvider {
    static var previews: some View {
        MegaphoneView()
    }
}

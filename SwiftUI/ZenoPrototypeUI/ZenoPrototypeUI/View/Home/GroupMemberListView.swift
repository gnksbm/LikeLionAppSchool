//
//  GroupMemberListView.swift
//  ZenoPrototypeUI
//
//  Created by gnksbm on 2023/09/20.
//

import SwiftUI

struct GroupMemberListView: View {
    @Environment(\.dismiss) private var dismiss
    
    let action: () -> ()
    var body: some View {
        List {
            ForEach(0..<9) { index in
                HStack {
                    Button("사람\(index)") {
                        
                    }
                    Spacer()
                    if index == 0 {
                        Image(systemName: "checkmark")
                    }
                }
            }
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button("투표요청") {
                    dismiss()
                    action()
                }
            }
        }
    }
}

struct GroupMemberListView_Previews: PreviewProvider {
    static var previews: some View {
        GroupMemberListView(action: { })
    }
}

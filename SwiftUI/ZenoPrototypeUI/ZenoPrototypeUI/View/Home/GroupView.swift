//
//  GroupView.swift
//  ZenoPrototypeUI
//
//  Created by gnksbm on 2023/09/20.
//

import SwiftUI

struct GroupView: View {
    @State private var isPresented: Bool = false
    
    var body: some View {
        ScrollView {
            ForEach(0..<9) { index in
                GroupVoteCellView()
            }
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                HStack {
                    NavigationLink {
                        GroupMemberListView(action: { isPresented = true})
                    } label: {
                        Text("투표요청하기")
                    }
                    ShareLink("초대하기", item: "앱스토어링크")
                }
            }
        }
        .sheet(isPresented: $isPresented) {
            VoteView()
        }
    }
}

struct MyVoteAlertView_Previews: PreviewProvider {
    static var previews: some View {
        GroupView()
    }
}

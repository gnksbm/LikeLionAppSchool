//
//  ContentView.swift
//  ScrumdingerUI
//
//  Created by gnksbm on 2023/08/01.
//

import SwiftUI

struct MeetingView: View {
    @Binding var scrum: DailyScrum
    @State var secondElapsed: Int = 300
    @State var secondRemaining: Int = 600
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 16)
                .fill(scrum.theme.mainColor)
            VStack {
                MeetingHeaderView(secondElapsed: $secondElapsed, secondRemaining: $secondRemaining, theme: scrum.theme)
                
                Circle()
                    .strokeBorder(lineWidth: 24)
                    
                HStack {
                    Text("Speaker 1 of 3")
                    Button {
                        
                    } label: {
                        Image(systemName: "forward.fill")
                    }
                }
            }
        }
        .padding()
        .foregroundColor(scrum.theme.accentColor)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct MeetingView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            MeetingView(scrum: .constant(DailyScrum.sampleDatas[0]))
        }
    }
}



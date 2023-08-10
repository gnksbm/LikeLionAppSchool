//
//  ContentView.swift
//  ScrumdingerUI
//
//  Created by gnksbm on 2023/08/01.
//

import SwiftUI

struct MeetingView: View {
    @Binding var scrum: DailyScrum
    
    @State var secondElapsed: Int = 0
    @State var secondRemaining: Int = 1000
    var color: Color {
        switch secondElapsed % 5 {
        case 0:
            return scrum.theme.mainColor
        case 1,3:
            return .black
        case 2:
            return .red
        case 4:
            return .orange
        default:
            return .white
        }
    }
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 16)
//                .fill(scrum.theme.mainColor)
                .fill(Double(secondElapsed) < ((Double(secondElapsed) + Double(secondRemaining)) * 0.8) ? scrum.theme.mainColor : color)
            VStack {
                MeetingHeaderView(secondElapsed: $secondElapsed, secondRemaining: $secondRemaining, theme: scrum.theme)
                Circle()
                    .strokeBorder(lineWidth: 24)
                    .padding(.horizontal)
                    .onTapGesture {
                        Timer.scheduledTimer(withTimeInterval: 0.005, repeats: true) { timer in
                            if secondRemaining > 0 {
                                let time = 1
                                self.secondElapsed += time
                                self.secondRemaining -= time
                                print(secondElapsed)
                            } else {
                                timer.invalidate()
                            }
                        }
                    }
                    
                HStack {
                    Text("Speaker 1 of 3")
                    Button {
                        Timer.scheduledTimer(withTimeInterval: 0.05, repeats: true) { timer in
                            if secondRemaining > 0 {
                                let time = 1
                                self.secondElapsed += time
                                self.secondRemaining -= time
                                print(secondElapsed)
                            } else {
                                timer.invalidate()
                            }
                        }
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
            MeetingView(scrum: .constant(DailyScrum.emptyData))
        }
    }
}



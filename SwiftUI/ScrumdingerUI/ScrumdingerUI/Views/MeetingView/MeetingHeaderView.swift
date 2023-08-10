//
//  MeetingHeaderView.swift
//  ScrumdingerUI
//
//  Created by gnksbm on 2023/08/01.
//

import SwiftUI

struct MeetingHeaderView: View {
    @Binding var secondElapsed: Int
    @Binding var secondRemaining: Int
    let theme: Theme
    
    private var totalSeconds: Int {
        secondElapsed + secondRemaining
    }
    private var progress: Double {
        guard totalSeconds > 0 else { return 1 }
        return Double(secondElapsed) / Double(totalSeconds)
    }
    private var minuteElapsed: Int {
        secondElapsed / 60
    }
    private var minuteRemaining: Int {
        secondRemaining / 60
    }
    
    var body: some View {
        VStack {
            ProgressView(value: progress)
                .progressViewStyle(ScrumProgressViewStyle(theme: theme))
            HStack {
                VStack(alignment: .leading) {
                    Text("Second Elapsed")
                        .font(.caption)
                    Label("\(minuteElapsed):\(secondElapsed % 60)", systemImage: "hourglass.tophalf.fill")
                }
                Spacer()
                VStack(alignment: .trailing)  {
                    Text("Second Remaining")
                        .font(.caption)
                    Label("\(minuteRemaining):\(secondRemaining % 60)" , systemImage: "hourglass.bottomhalf.fill")
                        .labelStyle(.trailingIcon)
                }
            }
        }
        .accessibilityElement(children: .ignore)
        .accessibilityLabel("Time remaining")
        .accessibilityValue("\(minuteRemaining) minutes")
        .padding([.top, .horizontal])
    }
}

struct MeetingHeaderView_Preview: PreviewProvider {
    @State static var secondElapsed = 1500
    @State static var secondRemaining = 0
    
    static var previews: some View {
        MeetingHeaderView(secondElapsed: $secondElapsed, secondRemaining: $secondRemaining, theme: Theme.bubblegum)
            .previewLayout(.sizeThatFits)
    }
}

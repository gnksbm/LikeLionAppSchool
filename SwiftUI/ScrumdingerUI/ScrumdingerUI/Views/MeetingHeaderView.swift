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
    private var minuteRemaining: Int {
        secondRemaining / 60
    }
    
    var body: some View {
        VStack {
            ProgressView(value: progress)
//                .progressViewStyle(ScrumPro)
            HStack {
                VStack(alignment: .leading) {
                    Text("Second Elapsed")
                        .font(.caption)
                    Label("\(secondElapsed)", systemImage: "hourglass.tophalf.fill")
                }
                Spacer()
                VStack(alignment: .trailing)  {
                    Text("Second Remaining")
                        .font(.caption)
                    Label("\(secondRemaining)" , systemImage: "hourglass.bottomhalf.fill")
                }
            }
        }
        .onAppear {
            Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: { Timer in
                if totalSeconds > 0 {
                    self.secondElapsed += 50
                    print(secondElapsed)
                } else {
                    Timer.invalidate()
                }
            })
        }
        .accessibilityElement(children: .ignore)
        .accessibilityLabel("Time remaining")
        .accessibilityValue("10 minutes")
    }
}

struct MeetingHeaderView_Preview: PreviewProvider {
    static var previews: some View {
        MeetingHeaderView(secondElapsed: .constant(5), secondRemaining: .constant(10), theme: Theme.bubblegum)
            .previewLayout(.sizeThatFits)
    }
}

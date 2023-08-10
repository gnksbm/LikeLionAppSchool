//
//  DailyScrum.swift
//  ScrumdingerUI
//
//  Created by gnksbm on 2023/08/01.
//

import Foundation

struct DailyScrum: Identifiable {
    let id: UUID = UUID()
    var title: String
    var attendees: [Attendee]
    var lengthInMinutes: Int
    var lengthInMinutesAsDouble: Double {
        get {
            Double(lengthInMinutes)
        }
        set {
            lengthInMinutes = Int(newValue)
        }
    }
    var theme: Theme
    
    init(title: String, attendees: [String], lengthInMinutes: Int, theme: Theme) {
        self.title = title
        self.attendees = attendees.map { Attendee(name: $0) }
        self.lengthInMinutes = lengthInMinutes
        self.theme = theme
    }
}

extension DailyScrum {
    struct Attendee: Identifiable {
        let id = UUID()
        var name: String
    }
}

extension DailyScrum {
    static var emptyData: Self {
        DailyScrum(title: "", attendees: [], lengthInMinutes: 5, theme: .teal)
    }
}

extension Array<DailyScrum.Attendee> {
    var speakers: [ScrumTimer.Speaker] {
        if isEmpty {
            return [ScrumTimer.Speaker(name: "None", isComplete: false)]
        } else {
            return map { ScrumTimer.Speaker(name: $0.name, isComplete: false) }
        }
    }
}

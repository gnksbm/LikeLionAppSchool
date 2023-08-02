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
    static let sampleDatas: [Self] = [
        DailyScrum(title: "Design",
                   attendees: ["Cathy", "Daisy", "Simon", "Jonathan"],
                   lengthInMinutes: 10,
                   theme: .yellow),
        DailyScrum(title: "App Dev",
                   attendees: ["Katie", "Gray", "Euna", "Luis", "Darla"],
                   lengthInMinutes: 5,
                   theme: .orange),
        DailyScrum(title: "Web Dev",
                   attendees: ["Chella", "Chris", "Christina", "Eden", "Karla", "Lindsey", "Aga", "Chad", "Jenn", "Sarah"],
                   lengthInMinutes: 5,
                   theme: .poppy)
    ]
    
    static var emptyData: Self {
        DailyScrum(title: "", attendees: [], lengthInMinutes: 5, theme: .teal)
    }
}

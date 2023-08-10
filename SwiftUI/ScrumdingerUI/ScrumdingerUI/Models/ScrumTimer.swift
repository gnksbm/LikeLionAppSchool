//
//  ScrumTimer.swift
//  ScrumdingerUI
//
//  Created by gnksbm on 2023/08/02.
//

import Foundation

@MainActor
final class ScrumTimer: ObservableObject {
    private(set) var lengthInMinute: Int
    private var lengthInSeconds: Int { lengthInMinute * 60 }
    private var secondElapsed = 0
    private var secondRemaining = 0
    private var secondsPerSpeaker: Int { lengthInSeconds / speakers.count }
    private var secondElipsedForSpeaker: Int = 0
    
    private weak var timer: Timer?
    private var timerStopped = false
    private var frequency: TimeInterval { 1.0 / 60.0 }
    
    private(set) var speakers = [Speaker]()
    private var activeSpeaker = ""
    private var speakerIndex: Int = 0
    private var speakerText: String {
        return "Speaker \(speakerIndex + 1): \(speakers[speakerIndex].name)"
    }
    
    var speakerChangeAction: (() -> ())?
    
    private var startDate: Date?
    
    init(lengthInMinute: Int = 0, attendees: [DailyScrum.Attendee]) {
        self.lengthInMinute = lengthInMinute
        self.secondRemaining = lengthInSeconds
        self.speakers = attendees.speakers
        activeSpeaker = speakerText
    }
    
    func startScrum() {
        timer = Timer.scheduledTimer(withTimeInterval: frequency, repeats: true) { [weak self] timer in
            timer.tolerance = 0.1
        }
    }
    
    struct Speaker: Identifiable {
        let id = UUID()
        let name: String
        var isComplete: Bool
    }
}

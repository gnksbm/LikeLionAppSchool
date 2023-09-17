//
//  NotificationManager.swift
//  NotificationUI
//
//  Created by gnksbm on 2023/09/16.
//

import Foundation
import UserNotifications

class NotificationManager: ObservableObject {
    static let shared = NotificationManager()
    private init () { }
    
    let notiCenter = UNUserNotificationCenter.current()
    
    @Published var notiTitle: String = ""
    @Published var notiBody: String = ""
    
    func requestAllow() {
        notiCenter.requestAuthorization(options: [.alert, .badge, .sound]) { isAllow, error in
            guard error == nil else { return }
            print("Noti Available \(isAllow)")
        }
    }
    
    func makeNoti() {
        let content = UNMutableNotificationContent()
        content.title = "title"
        content.body = "body"
        content.sound = .default
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 0.1, repeats: false)
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
        notiCenter.getNotificationSettings { setting in
            print(setting)
        }
        notiCenter.add(request) { error in
            guard let error else { return }
            print(#function, error.localizedDescription)
        }
    }
}

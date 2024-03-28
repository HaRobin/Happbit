//
//  NotificationViewModel.swift
//  Happbit
//
//  Created by halm robin on 27/03/2024.
//

import Foundation
import UserNotifications

class NotificationViewModel: ObservableObject {
    
    var Notifications : [Notification]
    
    init() {
        Notifications = []
    }
    
    func setupNotifications(count: Int) {
//        print("test")
        clearNotification()
        generateNotifications(count: count)
        scheduleNotifications()
    }
    
    func scheduleNotifications() {
        for (_, notif ) in Notifications.enumerated() {
            // Create the trigger for the notification
            let trigger = UNCalendarNotificationTrigger(dateMatching: notif.dateComponents, repeats: true)
            
            // Create the notification request with a unique identifier, your content, and the trigger
            let request = UNNotificationRequest(identifier: notif.uuid, content: notif.content, trigger: trigger)
            
            // Schedule the notification request
            UNUserNotificationCenter.current().add(request) { error in
                if let error = error {
                    print("Error scheduling notification: \(error)")
                }
            }
        }
    }
    
    func generateNotifications(count: Int){
        if (count > 2) {
            let interval: Double = Double(((18-8) * 3600) / count)
            for i in 1..<count-1 {
                let scd : Double = Double(i) * interval
                let hour : Int = Int((8 * 3600 + scd) / 3600)
                let minute : Int = Int(scd.truncatingRemainder(dividingBy: 3600) / 60)
                print("---")
                print(hour)
                print(minute)
                Notifications.append(createNotification(hour: hour, minute: minute))
            }
        }
        if (count >= 2) {
            Notifications.append(createNotification(hour: 18, minute: 0))
        }
        if (count >= 1) {
            Notifications.append(createNotification(hour: 8, minute: 0))
        }
    }
    
    func clearNotification() {
        UNUserNotificationCenter.current().removePendingNotificationRequests(withIdentifiers: Notifications.map{$0.uuid})
        Notifications.removeAll()
    }
    
    func createNotification(hour: Int, minute: Int) -> Notification {
        
        let content = UNMutableNotificationContent()
        content.title = "Happbit"
        content.subtitle = "Do your task"
        content.sound = UNNotificationSound.default
        
        var dateComponents = DateComponents()
        dateComponents.hour = hour
        dateComponents.minute = minute

        return Notification(content: content, dateComponents: dateComponents, uuid: UUID().uuidString)
    }
}

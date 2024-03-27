//
//  Notification.swift
//  Happbit
//
//  Created by halm robin on 27/03/2024.
//

import Foundation
import UserNotifications

struct Notification {
    var content : UNMutableNotificationContent
    var dateComponents : DateComponents
    var uuid : String
}

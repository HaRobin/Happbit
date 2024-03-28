//
//  SettingsView.swift
//  Happbit
//
//  Created by halm robin on 20/03/2024.
//

import SwiftUI

struct SettingsView: View {
    
    @EnvironmentObject var notificationViewModel: NotificationViewModel
    
    @State var isPermissionGranted: Bool = false
    @State var nbNotification: Int = 1
    
    var body: some View {
        
        NavigationView {
            VStack {
                
                if !isPermissionGranted {
                    Button("Request Permission") {
                        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { granted, error in
                            DispatchQueue.main.async {
                                self.isPermissionGranted = granted
                            }
                            if granted {
                                print("All set!")
                            } else if let error = error {
                                print(error.localizedDescription)
                            }
                        }
                    }
                            
                }
                else {
                    HStack {
                        Text("Number of notification :")
                            
                        
                        Spacer()
                        
                        TextField("Enter expense amount", value: $nbNotification, formatter: NumberFormatter())
                            .keyboardType(.numberPad)
                            .padding(.horizontal)
                            .frame(width: 100, height: 30)
                            .background(Color(.systemGray5))
                            .cornerRadius(10)
                            .onChange(of: nbNotification) { newValue in
                                notificationViewModel.setupNotifications(count: newValue)
                            }
                            
                            
                        Spacer()
                    }
                }

                
                Spacer()
             
                Button("test notification") {
                    let content = UNMutableNotificationContent()
                    content.title = "Happbit"
                    content.subtitle = "Do your task"
                    content.sound = UNNotificationSound.default

                    // show this notification five seconds from now
                    let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)

                    // choose a random identifier
                    let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)

                    // add our notification request
                    UNUserNotificationCenter.current().add(request)
                }
                
                Spacer()
                
                
            }
            
            .padding()
            .navigationTitle("Settings")
        }
        .onAppear {
            UNUserNotificationCenter.current().getNotificationSettings { settings in
                DispatchQueue.main.async {
                    self.isPermissionGranted = settings.authorizationStatus == .authorized
                }
            }
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
       
        SettingsView()
            .environmentObject(NotificationViewModel())

    }
}

//let content = UNMutableNotificationContent()
//content.title = "Feed the cat"
//content.subtitle = "It looks hungry"
//content.sound = UNNotificationSound.default
//
//// Set up the date components for the time you want the notification to trigger
//var dateComponents =  ()
//dateComponents.hour = 8  // 8 AM
//dateComponents.minute = 0
//
//// Create the trigger for the notification
//let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)
//
//// Create the notification request with a unique identifier, your content, and the trigger
//let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
//
//// Schedule the notification request
//UNUserNotificationCenter.current().add(request) { error in
//    if let error = error {
//        print("Error scheduling notification: \(error)")
//    }
//}

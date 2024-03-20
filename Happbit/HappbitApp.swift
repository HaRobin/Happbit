//
//  HappbitApp.swift
//  Happbit
//
//  Created by quaile fyleas on 06/03/2024.
//

import SwiftUI

@main
struct HappbitApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(HabitViewModel())
        }
    }
}

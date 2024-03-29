//
//  ContentView.swift
//  Happbit
//
//  Created by quaile fyleas on 06/03/2024.
//

import SwiftUI
import UserNotifications

struct ContentView: View {
    var body: some View {
       NavigationHappbit()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(HabitViewModel())
            .environmentObject(HistoryViewModel())
    }
}

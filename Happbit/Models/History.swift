//
//  History.swift
//  Happbit
//
//  Created by halm robin on 06/03/2024.
//

import Foundation

struct History: Identifiable {
    var id = UUID()
    
    var date: Date
    var habits: [Habit] = []
    
    static var testData = [
        History(date: Date(), habits: Habit.testData)
    ]
}

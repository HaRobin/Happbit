//
//  History.swift
//  Happbit
//
//  Created by quaile fyleas on 27/03/2024.
//

import Foundation

struct History: Identifiable {
    var id = UUID()
    
    var date: Date
    var habits: [Habit]
    
    static var testData = [
        History(date: Date(), habits: Habit.testData),
        History(date: Date()-86400, habits: Habit.testData),
        History(date: Date()-86400*2, habits: Habit.testData),
        History(date: Date()-86400*3, habits: Habit.testData),
        History(date: Date()-86400*4, habits: Habit.testData)
        
    ]
}

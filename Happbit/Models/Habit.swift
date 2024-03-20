//
//  Habit.swift
//  Happbit
//
//  Created by halm robin on 06/03/2024.
//

import Foundation

enum SelectedTime: String, CaseIterable{
    case week = "Week"
    case month = "Month"
    case all = "All"
}

struct Habit: Identifiable {
    var id = UUID()
    
    var status: Bool
    var title: String
    
    var history: [Date] 
    
    static var testData = [
        Habit(status: false, title: "Read 5 minutes", history: [Date()-2, Date()-1, Date()]),
        Habit(status: true, title: "Wake up", history: [Date()-2, Date()-1, Date()]),
        Habit(status: false, title: "Walk 5 minutes", history: [Date()-2, Date()-1, Date()]),
        Habit(status: true, title: "Work 2 minutes", history: [Date()-2, Date()-1, Date()]),
        Habit(status: false, title: "Do 5 pushup", history: [Date()-2, Date()-1, Date()]),
        Habit(status: true, title: "Don't eat more than 20 bags of chips", history: [Date()-2, Date()-1, Date()])
    ]
    
    
}

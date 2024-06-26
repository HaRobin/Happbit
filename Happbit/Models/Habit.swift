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
    
    static var testData = [
        Habit(status: false, title: "Read 5 minutes"),
        Habit(status: true, title: "Wake up"),
        Habit(status: false, title: "Walk 5 minutes"),
        Habit(status: true, title: "Work 2 minutes"),
        Habit(status: false, title: "Do 5 pushup"),
        Habit(status: true, title: "Don't eat more than 20 bags of chips")
    ]
    
    
    static var data2sur3 = [
        Habit(status: true, title: "random"),
        Habit(status: false, title: "random"),
        Habit(status: true, title: "random")
    ]
    
    static var data5sur5 = [
        Habit(status: true, title: "random"),
        Habit(status: true, title: "random"),
        Habit(status: true, title: "random"),
        Habit(status: true, title: "random"),
        Habit(status: true, title: "random")
    ]
    
    static var data0sur1 = [
        Habit(status: false, title: "random")
    ]
    
    static var data3sur4 = [
        Habit(status: true, title: "random"),
        Habit(status: false, title: "random"),
        Habit(status: true, title: "random"),
        Habit(status: true, title: "random")
    ]
    
}

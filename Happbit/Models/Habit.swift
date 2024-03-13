//
//  Habit.swift
//  Happbit
//
//  Created by halm robin on 06/03/2024.
//

import Foundation

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
    
    
}

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
        History(date: Date()-86400*11, habits: Habit.data3sur4),
        History(date: Date()-86400*2, habits: Habit.data5sur5),
        History(date: Date()-86400*3, habits: Habit.data5sur5),
        History(date: Date()-86400*4, habits: Habit.data0sur1),
        History(date: Date()-86400*5, habits: Habit.data2sur3),
        History(date: Date()-86400*6, habits: Habit.data3sur4),
        History(date: Date()-86400*7, habits: Habit.data0sur1),
        History(date: Date()-86400*8, habits: Habit.data5sur5),
        History(date: Date()-86400*9, habits: Habit.data3sur4),
        History(date: Date()-86400*10, habits: Habit.testData),
        History(date: Date()-86400*15, habits: Habit.data3sur4),
        History(date: Date()-86400*20, habits: Habit.data0sur1),
        History(date: Date()-86400*25, habits: Habit.data2sur3),
        History(date: Date()-86400*30, habits: Habit.data5sur5),
        History(date: Date()-86400*31, habits: Habit.data3sur4),
        History(date: Date()-86400*60, habits: Habit.data0sur1),
        History(date: Date()-86400*80, habits: Habit.data2sur3),
        History(date: Date()-86400*90, habits: Habit.data5sur5),
        History(date: Date()-86400*99, habits: Habit.data0sur1),
        History(date: Date()-86400*110, habits: Habit.data3sur4),
        History(date: Date()-86400*120, habits: Habit.data5sur5),
        History(date: Date()-86400*140, habits: Habit.data3sur4),
        History(date: Date()-86400*160, habits: Habit.data2sur3),
        History(date: Date()-86400*170, habits: Habit.data0sur1),
        History(date: Date()-86400*180, habits: Habit.data5sur5),
        History(date: Date()-86400*190, habits: Habit.data0sur1),
        History(date: Date()-86400*200, habits: Habit.data0sur1),
        History(date: Date()-86400*210, habits: Habit.data2sur3),
        History(date: Date()-86400*230, habits: Habit.data0sur1),
        History(date: Date()-86400*250, habits: Habit.data2sur3),
        History(date: Date()-86400*270, habits: Habit.data3sur4),
        History(date: Date()-86400*280, habits: Habit.data0sur1),
        History(date: Date()-86400*330, habits: Habit.data2sur3),
        History(date: Date()-86400*365, habits: Habit.data0sur1),
        
    ]
}

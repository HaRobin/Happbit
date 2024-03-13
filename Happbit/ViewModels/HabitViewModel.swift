//
//  HabitViewModel.swift
//  Happbit
//
//  Created by halm robin on 06/03/2024.
//

import Foundation

class HabitViewModel: ObservableObject {
    
    @Published var doneHabits: [Habit] = []
    
    @Published var ongoingHabits: [Habit] = []
    
    init() {
        getHabits()
    }
    
    func getHabits() {
        for (_, habit) in Habit.testData.enumerated() {
            if habit.status {
                doneHabits.append(habit)
            }
            else {
                ongoingHabits.append(habit)
            }
        }
    }
    
    func completeHabit(habit:Habit) {
        for (index, hb) in ongoingHabits.enumerated() {
            if habit.id == hb.id {
                ongoingHabits[index].status.toggle()
                doneHabits.append(ongoingHabits[index])
                ongoingHabits.remove(at: index)
            }
        }
    }
    
    func addHabit(title: String) {
        ongoingHabits.append(Habit(status: false, title: title))
    }
    
    func deleteHabit(indexSet: IndexSet) {
        ongoingHabits.remove(atOffsets: indexSet)
    }
    
    func getProgression() -> Float {
        let prc:Float = Float(doneHabits.count) / (Float(doneHabits.count) + Float(ongoingHabits.count))
        return prc
    }
}

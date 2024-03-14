//
//  HabitRowView.swift
//  Happbit
//
//  Created by halm robin on 14/03/2024.
//

import SwiftUI

struct HabitRowView: View {
    
    let habit: Habit
    
    var body: some View {
        HStack{
            Image(systemName: habit.status ? "checkmark.circle" : "circle")
                .foregroundColor(habit.status ? .green : .red)
            
            Text(habit.title)
                .font(.title3)
            
            Spacer()
            
        }
        .font(.title2)
        .padding(.vertical, 8)
    }
}

struct HabitRowView_Previews: PreviewProvider {
    static var previews: some View {
        HabitRowView(habit: Habit.testData[0])
    }
}

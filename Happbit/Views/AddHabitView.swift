//
//  AddHabitView.swift
//  Happbit
//
//  Created by quaile fyleas on 13/03/2024.
//

import SwiftUI

struct AddHabitView: View {
    
    @State var habitTitle: String = ""
    
    @EnvironmentObject var habitViewModel: HabitViewModel
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack(spacing: 16){
            
            TextField("Enter a habit", text: $habitTitle)
                .padding(.horizontal)
                .frame(height: 55)
                .background(Color(.systemGray5))
                .cornerRadius(10)
            
            Button{
                habitViewModel.addHabit(title: habitTitle)
                presentationMode.wrappedValue.dismiss()
            } label: {
                Text("Save")
                    .font(.headline)
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)
                    .background(.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            
            Spacer()
        }
        .padding(16)
        .navigationTitle("Add a Habit")
    }
}

struct AddHabitView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            AddHabitView()
        }
    }
}

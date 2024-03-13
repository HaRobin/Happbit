//
//  HabitListView.swift
//  Happbit
//
//  Created by halm robin on 13/03/2024.
//

import SwiftUI

struct HabitListView: View {
    var body: some View {
        NavigationView {
            VStack {
                
            }
            .navigationTitle("Habits")
            .toolbar{
                ToolbarItem(placement: .navigationBarLeading) {
                    EditButton()
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink("Add", destination: AddHabitView())
                }
            }

        }
    }
}

struct HabitListView_Previews: PreviewProvider {
    static var previews: some View {
        HabitListView()
    }
}

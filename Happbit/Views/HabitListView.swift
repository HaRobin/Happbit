//
//  HabitListView.swift
//  Happbit
//
//  Created by halm robin on 13/03/2024.
//

import SwiftUI

struct HabitListView: View {
    
    @EnvironmentObject var habitViewModel : HabitViewModel
    
    var body: some View {
        NavigationView {
            //            AXChartDescriptor à utilisé pour faire les stats
            VStack {
                // Barre de progression
                HStack {
                    GeometryReader { geometry in
                        ZStack(alignment: .leading) {
                            Rectangle() // Arrière-plan de la barre de progression
                                .frame(width: geometry.size.width, height: 20)
                                .cornerRadius(10)
                                .opacity(0.3)
                                .foregroundColor(Color.gray)
                            
                            Rectangle() // La partie colorée de la barre de progression
                                .frame(width: geometry.size.width * CGFloat(habitViewModel.getProgression()), height: 20)
                                .cornerRadius(10)
                                .foregroundColor(Color.blue) // La couleur bleue de la progression
                        }
                    }.frame(height: 20) // Fixer la hauteur de la barre de progression
                    Text(String(format: "%.0f",roundf(habitViewModel.getProgression() * 100)) + "%")
                }
                .padding(.horizontal)
                .padding(.top)
                
                
                //                  TODO : Add onDelete, onMove qctions
                
                List {
                    if !habitViewModel.ongoingHabits.isEmpty{
                        Section(
                            header:
                                Text("Ongoing habits")
                                .font(.title3)
                            
                        ) {
                            ForEach (habitViewModel.ongoingHabits) { habit in
                                //                        TODO : Add the habit row view
                                HabitRowView(habit: habit)
                                    .onTapGesture {
                                        habitViewModel.completeHabit(habit: habit)
                                    }
                                
                            }
                            .onDelete(perform: habitViewModel.deleteHabit)
                            .onMove(perform: habitViewModel.moveHabit)
                        }
                    }
                    
                    Section(
                        header:
                            habitViewModel.ongoingHabits.isEmpty ?
                        Text("All habits are done")
                            .font(.title3) :
                            Text("Done habits")
                            .font(.title3)
                    ) {
                        ForEach (habitViewModel.doneHabits) { habit in
                            //                        TODO : Add the habit row view
                            HabitRowView(habit: habit)
                        }
                    }
                }
                .listStyle(PlainListStyle())
                
                Spacer()
                
                
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
            .environmentObject(HabitViewModel())
    }
}

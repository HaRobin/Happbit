//
//  StatsView.swift
//  Happbit
//
//  Created by quaile fyleas on 13/03/2024.
//

import SwiftUI
import Charts

struct StatsView: View {
    
    @State var selectedTime: SelectedTime = .week
    
    @EnvironmentObject var historyViewModel: HistoryViewModel
    
    var body: some View {
        VStack(spacing: 16){
            HStack(spacing:16){
                Image(systemName: "flame.fill")
                    .padding(.leading, 16)
                    .font(.title)
                    .foregroundColor(.red)
                Text("Streak")
                    .font(.largeTitle)
                    
                Spacer()
            }
            
            HStack(spacing: 16){
                Spacer()
                VStack(spacing: 16){
                    Text("3")
                        .font(.title2)
                    Text("Current")
                        .font(.title2)
                }
                Spacer()
                VStack(spacing: 16){
                    Text("15")
                        .font(.title2)
                    Text("Best")
                        .font(.title2)
                }
                Spacer()
            }
            
            HStack(spacing: 16){
                Image(systemName: "arrow.up.right.circle")
                    .padding(.leading, 16)
                    .font(.title)
                    .foregroundColor(.green)
                Text("Stats")
                    .font(.largeTitle)
                Spacer()
            }
            .padding(.top, 40)
            
            VStack(spacing: 16){
                Picker("Select Time", selection: $selectedTime){
                    ForEach(SelectedTime.allCases, id: \.self){ selectedTime in
                        Text(selectedTime.rawValue)
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
                switch selectedTime {
                case .week:
                    Chart(Array(historyViewModel.weekHistoryDone.keys.sorted()), id: \.self){ keyDay in
                        BarMark(
                            x: .value("Date", keyDay),
                            y: .value("Task Done", historyViewModel.weekHistoryDone[keyDay] ?? 0)
                        )
                    }
                case .month:
                    Chart(Array(historyViewModel.monthHistoryDone.keys.sorted()), id: \.self){ keyDay in
                        LineMark(
                            x: .value("Date", keyDay),
                            y: .value("Task", historyViewModel.monthHistoryDone[keyDay] ?? 0)
                        )
                    }
                case .all:
                    Chart(Array(historyViewModel.allHistoryDone.keys.sorted()), id: \.self){ keyDay in
                        LineMark(
                            x: .value("Date", keyDay),
                            y: .value("Task", historyViewModel.allHistoryDone[keyDay] ?? 0)
                        )
                    }
                }
                
                
                
            }
            
            Spacer()
        }
    }
}

struct StatsView_Previews: PreviewProvider {
    static var previews: some View {
        StatsView()
            .environmentObject(HistoryViewModel())
    }
}

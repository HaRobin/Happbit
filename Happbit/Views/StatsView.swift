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
                    Text(String(historyViewModel.currentStreak))
                        .font(.title2)
                    Text("Current")
                        .font(.title2)
                }
                Spacer()
                VStack(spacing: 16){
                    Text(String(historyViewModel.bestStreak))
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
                    Chart(historyViewModel.weekHistory.sorted(by: { HistoryChart1, HistoryChart2 in
                        HistoryChart1.date > HistoryChart2.date
                    })){
                        BarMark(
                            x: .value("Date", $0.date),
                            y: .value("Task", $0.nb)
                        )
                        .foregroundStyle(by: .value("Task Status", $0.status))
                    }
                case .month:
                    Chart(historyViewModel.monthHistory.sorted(by: { HistoryChart1, HistoryChart2 in
                        HistoryChart1.date > HistoryChart2.date
                    })){
                        BarMark(
                            x: .value("Date", $0.date),
                            y: .value("Task", $0.nb)
                        )
                        .foregroundStyle(by: .value("Task Status", $0.status))
                    }
                case .all:
                    Chart(historyViewModel.allHistory.sorted(by: { HistoryChart1, HistoryChart2 in
                        HistoryChart1.date > HistoryChart2.date
                    })){
                        BarMark(
                            x: .value("Date", $0.date),
                            y: .value("Task", $0.nb)
                        )
                        .foregroundStyle(by: .value("Task Status", $0.status))
                    }
                }
             
            }
            .padding(.horizontal)
            
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

//
//  HistoryViewModel.swift
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

class HistoryViewModel: ObservableObject {
    
    @Published var globalHistory: [History] = []
    
    @Published var weekHistory: [History] = []
    
    @Published var monthHistory: [History] = []
    
    
    init() {
        getHistory()
    }
    
    func getHistory(){
        globalHistory.append(contentsOf: History.testData)
        for (index, histo) in History.testData.enumerated() {
            if(index < 7){
                weekHistory.append(histo)
            }
            monthHistory.append(histo)
            if(index >= 30){
                break
            }
        }
    }
    
    func historyToDataChart(history: [History]){
        
    }
    
}

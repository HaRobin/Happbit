//
//  HistoryViewModel.swift
//  Happbit
//
//  Created by quaile fyleas on 20/03/2024.
//

import Foundation

class HistoryViewModel: ObservableObject {
 
    @Published var weekHistory: [String: Int] = [:]
    
    init() {
        getHistories()
    }
    
    func getHistories(){
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "d.M.yyyy"
        
        let currentDate = Date()
        let currentDateInt = Int(currentDate.timeIntervalSince1970)
        // 1 jour = 86 400 secondes
        for (_, habit) in Habit.testData.enumerated() {
            for (_, hbDate) in habit.history.enumerated(){
                let hbDateInt = Int(hbDate.timeIntervalSince1970)
                if((currentDateInt - hbDateInt) <= (86400 * 7)){
                    if(weekHistory[dateFormatter.string(from:hbDate)] != nil){
                        weekHistory[dateFormatter.string(from:hbDate)]! += 1
                    } else {
                        weekHistory[dateFormatter.string(from:hbDate)] = 1
                    }
                }
            }
        }
    }
    
}

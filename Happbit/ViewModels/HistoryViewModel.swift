//
//  HistoryViewModel.swift
//  Happbit
//
//  Created by quaile fyleas on 20/03/2024.
//

import Foundation

class HistoryViewModel: ObservableObject {
 
    @Published var weekHistoryDone: [String: Int] = [:]
    @Published var weekHistoryOnGoing: [String: Int] = [:]
    
    @Published var monthHistoryDone: [String: Int] = [:]
    @Published var monthHistoryOnGoing: [String: Int] = [:]
    
    @Published var allHistoryDone: [String: Int] = [:]
    @Published var allHistoryOnGoing: [String: Int] = [:]
    
    init() {
        getHistories()
    }
    
    func getHistories(){
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "d.M.yyyy"
        let monthFormatter = DateFormatter()
        monthFormatter.dateFormat = "M"
        
        let currentDate = Date()
        let currentDateInt = Int(currentDate.timeIntervalSince1970)
        // 1 jour = 86 400 secondes
        for (_, history) in History.testData.enumerated() {
            let historyDateInt = Int(history.date.timeIntervalSince1970)
            for (_, habit) in history.habits.enumerated(){
                // all
                // done
                if(habit.status){
                    if(allHistoryDone[monthFormatter.string(from:history.date)] != nil){
                        allHistoryDone[monthFormatter.string(from:history.date)]! += 1
                    } else {
                        allHistoryDone[monthFormatter.string(from:history.date)] = 1
                    }
                    // onGoing
                }else{
                    if(allHistoryOnGoing[monthFormatter.string(from:history.date)] != nil){
                        allHistoryOnGoing[monthFormatter.string(from:history.date)]! += 1
                    } else {
                        allHistoryOnGoing[monthFormatter.string(from:history.date)] = 1
                    }
                }
                // month
                if(monthFormatter.string(from: currentDate) == monthFormatter.string(from: history.date)){
                    // done
                    if(habit.status){
                        if(monthHistoryDone[dateFormatter.string(from:history.date)] != nil){
                            monthHistoryDone[dateFormatter.string(from:history.date)]! += 1
                        } else {
                            monthHistoryDone[dateFormatter.string(from:history.date)] = 1
                        }
                        // onGoing
                    }else{
                        if(monthHistoryOnGoing[dateFormatter.string(from:history.date)] != nil){
                            monthHistoryOnGoing[dateFormatter.string(from:history.date)]! += 1
                        } else {
                            monthHistoryOnGoing[dateFormatter.string(from:history.date)] = 1
                        }
                    }
                }
                
                // week
                if((currentDateInt - historyDateInt) <= (86400 * 7)){
                    // done
                    if(habit.status){
                        if(weekHistoryDone[dateFormatter.string(from:history.date)] != nil){
                            weekHistoryDone[dateFormatter.string(from:history.date)]! += 1
                        } else {
                            weekHistoryDone[dateFormatter.string(from:history.date)] = 1
                        }
                        // onGoing
                    }else{
                        if(weekHistoryOnGoing[dateFormatter.string(from:history.date)] != nil){
                            weekHistoryOnGoing[dateFormatter.string(from:history.date)]! += 1
                        } else {
                            weekHistoryOnGoing[dateFormatter.string(from:history.date)] = 1
                        }
                    }
                }
            }
        }
    }
    
}

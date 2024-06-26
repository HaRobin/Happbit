//
//  HistoryViewModel.swift
//  Happbit
//
//  Created by quaile fyleas on 20/03/2024.
//

import Foundation

class HistoryViewModel: ObservableObject {
 
    @Published var weekHistory: [HistoryChart] = []
    var tempWeekHistory: [HistoryChart] = []
    
    @Published var monthHistory: [HistoryChart] = []
    var tempMonthHistory: [HistoryChart] = []
    
    @Published var allHistory: [HistoryChart] = []
    var tempAllHistory: [HistoryChart] = []
    
    @Published var bestStreak: Int = 13
    @Published var currentStreak: Int = 0
    
    init() {
        getHistories()
        getStreaks()
    }
    
    func getStreaks(){
        var onStreaks: Bool = true
        var nbStreak: Int = 0
        var indexHisto: Int = 0
        while (onStreaks){
            if(indexHisto >= History.testData.count){
                onStreaks = false
            } else {
                for (_,habit) in History.testData[indexHisto].habits.enumerated(){
                    if(!habit.status){
                        onStreaks = false
                    }
                }
                if(onStreaks){
                    nbStreak+=1
                    indexHisto+=1
                }
            }
        }
        if(nbStreak > bestStreak){
            bestStreak = nbStreak
        }
        currentStreak = nbStreak
    }
    
    func sortedHistory(history: [HistoryChart])-> [HistoryChart]{
        var sortedHistory: [HistoryChart] = []
        for (_, elem) in history.enumerated(){
            if(elem.status == "Done"){
                sortedHistory.append(elem)
            }
        }
        for (_, elem) in history.enumerated(){
            if(elem.status == "Not Done"){
                sortedHistory.append(elem)
            }
        }
        return sortedHistory
    }
    
    func getHistories(){
        
        //clean all
        weekHistory.removeAll()
        monthHistory.removeAll()
        allHistory.removeAll()
        
        //init date formatter
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "d.M.yyyy"
        let monthFormatter = DateFormatter()
        monthFormatter.dateFormat = "M.yyyy"
        
        let currentDate = Date()
        let currentDateInt = Int(currentDate.timeIntervalSince1970)
        // 1 jour = 86 400 secondes
        for (_, history) in History.testData.enumerated() {
            let historyDateInt = Int(history.date.timeIntervalSince1970)
            for (_, habit) in history.habits.enumerated(){
                // fill
                tempAllHistory.append(HistoryChart(date:monthFormatter.string(from:history.date),nb:1,status:(habit.status) ? "Done" : "Not Done"))
                if(monthFormatter.string(from: currentDate) == monthFormatter.string(from: history.date)){
                    tempMonthHistory.append(HistoryChart(date:dateFormatter.string(from:history.date),nb:1,status:(habit.status) ? "Done" : "Not Done"))
                }
                if((currentDateInt - historyDateInt) <= (86400 * 7)){
                    tempWeekHistory.append(HistoryChart(date:dateFormatter.string(from:history.date),nb:1,status:(habit.status) ? "Done" : "Not Done"))
                }
                // sort
                allHistory = sortedHistory(history: tempAllHistory)
                monthHistory = sortedHistory(history: tempMonthHistory)
                weekHistory = sortedHistory(history: tempWeekHistory)
                
                
            }
        }
    }
    
}

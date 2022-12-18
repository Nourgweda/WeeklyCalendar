//
//  TaskViewModel.swift
//  WeeklyCalendar
//
//  Created by Nour Gweda on 13/12/2022.
//

import Foundation
import SwiftUI

class TaskViewModel: ObservableObject {
    
    @Published var storedTaks: [Task] =  tasksArray
    @Published var currentWeek: [Date] = []
    @Published var currentMonth: Int = 0
    @Published var currentDay = Date()
    @Published var filteredTask: [Task]?
    @Published var countNm: Int = 0
    
    //trial
    @Published var nextWeek: [Date] = []
    @Published var previousWeek: [Date] = []
    
    init() {
        fetchCurrentWeek()
        filteredTodayTask()
    }
    
    
    // get current week
    func fetchCurrentWeek() {
        // original code
        let today = Date()
        let calendar = Calendar.current
        currentWeek = []

        let week = calendar.dateInterval(of: .weekOfMonth, for: today)
        guard let firstWeekDay = week?.start else {return}

        (1...7).forEach { day in
            if let weekday = calendar.date(byAdding: .day, value: day+countNm, to: firstWeekDay) {
                currentDay = calendar.date(byAdding: .day, value: countNm, to: today)!
//                let components = calendar.dateComponents([.month], from: currentDay)
//                currentMonth = components.month ?? 0
                currentWeek.append(weekday)
            }
        }

        print(currentWeek, "🥳")
    }
    
    //get current month
    func getCurrentMonth(currentMonth: Int) -> Date {
        let calendar = Calendar.current
        guard let currentMonth = calendar.date(byAdding: .month, value: currentMonth, to: Date()) else {
            return Date()
        }
        return currentMonth
    }
        
    //to change the date format in the view
    func extractDate(date: Date, format: String) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        return formatter.string(from: date)
    }
    
    // check if the current date is today
    func isToday(day: Date) -> Bool {
        let calendar = Calendar.current
        return calendar.isDate(currentDay, inSameDayAs: day)
    }
    
    //filter task by date - today
    func filteredTodayTask() {
        DispatchQueue.global(qos: .userInteractive).async {
            let calendar = Calendar.current
            let filtered = self.storedTaks.filter {
                return calendar.isDate($0.taskDate, inSameDayAs: self.currentDay)
            }
                .sorted { task1, task2 in
                    return task2.taskDate > task1.taskDate
                }

            DispatchQueue.main.async {
                withAnimation {
                    self.filteredTask = filtered
                }
            }
        }
    }
    
    //check if the current hour is the task hour
    func isCurrentHour(date: Date) -> Bool {
        let calendar = Calendar.current
        let hour = calendar.component(.hour, from: date)
        let currentHour = calendar.component(.hour, from: Date())
        return hour == currentHour
    }
    
    //go to next or previous week
    func goToNextOrPreviousWeek(addedValue: Int) {
        self.countNm += addedValue
        self.fetchCurrentWeek()
    }

    func formatMonth() -> String{
        let date = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMMM"
        return dateFormatter.string(from: currentDay)
    }
    
}

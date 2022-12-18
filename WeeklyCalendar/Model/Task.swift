//
//  Task.swift
//  WeeklyCalendar
//
//  Created by Nour Gweda on 13/12/2022.
//

import Foundation
struct Task: Identifiable {
    var id = UUID().uuidString
    var taskTitle: String
    var taskDescription: String
    var taskDate: Date
}
    
    func setTaskDate(date: DateModel) -> Date{
        //let isoDate = "2022-12-30 15:10:26"
        let isoDate = "\(date.year)-\(date.month)-\(date.day) \(date.hour):\(date.minute):00"
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "GMT+2")
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let date = dateFormatter.date(from:isoDate)!
        return date
    }
    
    var dateArray: [DateModel] = [
        DateModel(year: 2022, month: 12, day: 17, hour: 11, minute: 30),
        DateModel(year: 2022, month: 12, day: 10, hour: 12, minute: 30),
        DateModel(year: 2022, month: 12, day: 09, hour: 13, minute: 20),
        DateModel(year: 2022, month: 12, day: 13, hour: 14, minute: 19),
        DateModel(year: 2022, month: 12, day: 13, hour: 15, minute: 40),
        DateModel(year: 2022, month: 12, day: 13, hour: 08, minute: 50),
        DateModel(year: 2022, month: 12, day: 11, hour: 17, minute: 10),
        DateModel(year: 2022, month: 12, day: 09, hour: 18, minute: 30)
        
    ]
    
    var tasksArray: [Task] = [
        Task(taskTitle: "Meeting", taskDescription: "Discuss team task for the day", taskDate: setTaskDate(date: dateArray[0])),
        Task(taskTitle: "Icon set", taskDescription: "Edit icon for team next week ", taskDate: setTaskDate(date: dateArray[1])),
        Task(taskTitle: "Prototype", taskDescription: "Make and send prototype", taskDate: setTaskDate(date: dateArray[2])),
        Task(taskTitle: "check assest", taskDescription: "start checking the assets", taskDate: setTaskDate(date: dateArray[3])),
        Task(taskTitle: "Team party", taskDescription: "Make fun with the team mates", taskDate: setTaskDate(date: dateArray[4])),
        Task(taskTitle: "Client meeting", taskDescription: "Explain project to client", taskDate: setTaskDate(date: dateArray[5])),
        Task(taskTitle: "Next project", taskDescription: "Discuss Next project with the team", taskDate: setTaskDate(date: dateArray[6])),
        Task(taskTitle: "App proposal", taskDescription: "Meet client for next app proposal", taskDate: setTaskDate(date: dateArray[7])),
    ]


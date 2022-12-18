//
//  TaskView.swift
//  WeeklyCalendar
//
//  Created by Nour Gweda on 13/12/2022.
//

import SwiftUI

//struct TaskView: View {
//
//    @ObservedObject var taskViewModel = TaskViewModel()
//
//    var body: some View {
//
//        LazyVStack(spacing: 18) {
//
//            if let tasks = taskViewModel.filteredTask {
//
//                if tasks.isEmpty {
//                    Text("No Tasks Found !!!")
//                        .font(.system(size: 16))
//                        .fontWeight(.light)
//                        .offset(y: 100)
//
//                } else {
//                    ForEach(tasks) { task in
//                        TaskCardView(task: task)
//                    }
//                }
//
//
//
//            } else {
//                ProgressView()
//                    .offset(y: 100)
//            }
//        }.onChange(of: taskViewModel.currentDay) { newValue in
//            taskViewModel.filteredTodayTask()
//        }
//    }
//}

//
//  TaskCardView.swift
//  WeeklyCalendar
//
//  Created by Nour Gweda on 13/12/2022.
//

import SwiftUI

struct TaskCardView: View {
    
    @State var task: Task?
    @ObservedObject var taskViewModel = TaskViewModel()
    
    var body: some View {
        HStack(alignment: .top, spacing: 30) {
            
            VStack(spacing: 10) {
                Circle()
                    .fill(taskViewModel.isCurrentHour(date: task?.taskDate ?? Date()) ? .black : .clear)
                    .frame(width: 15, height: 15)
                    .background(
                        Circle()
                            .stroke(.black, lineWidth: 1)
                            .padding(-3)
                    )
                    .scaleEffect((!taskViewModel.isCurrentHour(date: task?.taskDate ?? Date()) ? 0.8 : 1))
                Rectangle()
                    .fill(.black)
                    .frame(width: 3)
            }
            
            VStack {
                HStack(alignment: .top, spacing: 10) {
                    VStack(alignment: .leading, spacing: 12) {
                        Text(task?.taskTitle ?? "")
                            .font(.title2.bold())
                        
                        Text(task?.taskDescription ?? "")
                            .font(.callout)
                            .foregroundStyle(.secondary)
                    }
                    .hLeading()
                    
                    Text(task?.taskDate.formatted(date: .omitted, time: .shortened) ?? "")
                }
                
                //for team members circles
                if taskViewModel.isCurrentHour(date: task?.taskDate ?? Date()) {
                    HStack(spacing: 0) {
                        HStack(spacing: -10) {
                            ForEach(["User1","User2","User3"], id:\.self) { user in
                                Image(user)
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 45, height: 45)
                                    .clipShape(Circle())
                                    .background(
                                    Circle()
                                        .stroke(.black, lineWidth: 5)
                                    )
                                
                            }
                        }.hLeading()
                        Button {
                            
                        } label: {
                            Image(systemName: "checkmark")
                                .foregroundStyle(.black)
                                .padding(10)
                                .background(.white, in: RoundedRectangle(cornerRadius: 10))
                        }

                    }

                }
                
            }
            .foregroundColor(taskViewModel.isCurrentHour(date: task?.taskDate ?? Date()) ? .white : .black)
            .padding(taskViewModel.isCurrentHour(date: task?.taskDate ?? Date()) ? 15 : 0)
            .padding(.bottom, taskViewModel.isCurrentHour(date: task?.taskDate ?? Date()) ? 0 : 10)
            .hLeading()
            .background(
                    Color.black
                    .cornerRadius(25)
                    .opacity(taskViewModel.isCurrentHour(date: task?.taskDate ?? Date()) ? 1 : 0)
            )
            
        }.hLeading()
    }
}



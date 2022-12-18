//
//  Home.swift
//  WeeklyCalendar
//
//  Created by Nour Gweda on 13/12/2022.
//

import SwiftUI

struct Home: View {
    
    @StateObject var taskViewModel = TaskViewModel()
    @Namespace var animation
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            LazyVStack(spacing: 15, pinnedViews: [.sectionHeaders]) {
                Section {
                    
                   // ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 10) {
                            ForEach(taskViewModel.currentWeek, id: \.self) { day in
                                VStack(spacing: 10) {
                                    Text(taskViewModel.extractDate(date: day, format: "dd"))
                                        .font(.system(size: 15))
                                        .fontWeight(.semibold)
                                    
                                    // will return the day exp: Mon / Sat ...
                                    Text(taskViewModel.extractDate(date: day, format: "EEE"))
                                        .font(.system(size: 14))
                                    
                                    Circle()
                                        .fill(.white)
                                        .frame(width: 8, height: 8)
                                        .opacity(taskViewModel.isToday(day: day) ? 1 : 0 )
                                }
                                .foregroundStyle(taskViewModel.isToday(day: day) ? .primary : .secondary)
                                .foregroundColor(taskViewModel.isToday(day: day) ? .white : .black)
                                .frame(width: 45, height: 90)
                                .background(
                                    ZStack {
                                        if taskViewModel.isToday(day: day) {
                                            Capsule()
                                                .fill(.black)
                                                .matchedGeometryEffect(id: "CURRENTDAY", in: animation)
                                        }
                                    }
                                )
                                .contentShape(Capsule())
                                .onTapGesture {
                                    //update the current day
                                    withAnimation {
                                        taskViewModel.currentDay = day
                                    }
                                }
                            }
                        }.padding(.horizontal)
                    //}
                    
                    TaskView()
                    
                } header: {
                    HeaderView(viewModel: taskViewModel)
                }
            }
            
        }
        .ignoresSafeArea(.container, edges: .top)
    }
    
    func TaskView() -> some View {
        LazyVStack(spacing: 25) {
            
            if let tasks = taskViewModel.filteredTask {
                
                if tasks.isEmpty {
                    Text("No Tasks Found !!!")
                        .font(.system(size: 16))
                        .fontWeight(.light)
                        .offset(y: 100)
                    
                } else {
                    ForEach(tasks) { task in
                        TaskCardView(task: task)
                    }
                }
                
                
                
            } else {
                ProgressView()
                    .offset(y: 100)
            }
        }
        .padding()
        .padding(.top)
        .onChange(of: taskViewModel.currentDay) { newValue in
            taskViewModel.filteredTodayTask()
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}

extension View {
    
    func hLeading() -> some View {
        self .frame(maxWidth: .infinity,alignment: .leading)
    }
    
    func hTrailing() -> some View {
        self .frame(maxWidth: .infinity,alignment: .trailing)
    }
    
    func hCenter() -> some View {
        self .frame(maxWidth: .infinity,alignment: .center)
    }
}



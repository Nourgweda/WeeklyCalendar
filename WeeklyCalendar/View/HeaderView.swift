//
//  HeaderView.swift
//  WeeklyCalendar
//
//  Created by Nour Gweda on 13/12/2022.
//

import SwiftUI

func HeaderView(viewModel: TaskViewModel) -> some View {
    
    
    HStack(spacing: 10) {
        VStack(alignment: .leading, spacing: 10) {
            Text(Date().formatted(date: .abbreviated, time: .omitted))
                .foregroundColor(.gray)
            
            Text("Today")
                .font(.largeTitle.bold())
            
            Text("\(viewModel.formatMonth())")

        }
        .hLeading()
        
        Button {
            //back in time
            viewModel.goToNextOrPreviousWeek(addedValue: -7)

        } label: {
            Image(systemName: "chevron.left")
                .font(.title2)
                .foregroundColor(.black)
                .frame(width: 45, height: 45)
        }
        Button {
            //move to the future
            viewModel.goToNextOrPreviousWeek(addedValue: 7)

        } label: {
            Image(systemName: "chevron.right")
                .font(.title2)
                .foregroundColor(.black)
                .frame(width: 45, height: 45)
        }

    }
    .padding()
    .padding(.top, getSafeArea().top)
    .background(Color.white)
}



func getSafeArea() -> UIEdgeInsets {
    guard let screen = UIApplication.shared.connectedScenes.first as? UIWindowScene else {
        return .zero
    }
    guard let safeArea = screen.windows.first?.safeAreaInsets else {
        return .zero
    }
    return safeArea
}

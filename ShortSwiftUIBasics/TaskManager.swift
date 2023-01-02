//
//  TaskManager.swift
//  ShortSwiftUIBasics
//
//  Created by taha on 12/21/22.
//

import SwiftUI

struct TaskManager: View {
  @StateObject var taskModel: TaskViewModel = TaskViewModel()
  @Namespace var animation
  
  var body: some View {
    ScrollView(.vertical, showsIndicators: false) {
      LazyVStack(spacing: 15,
                 pinnedViews: [.sectionHeaders]) {
        Section {
          ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 10) {
              ForEach(taskModel.currentWeek, id: \.self) { day in
                VStack(spacing: 10) {
                  Text(taskModel.extractDate(date: day, format: "dd"))
                    .font(.system(size: 15))
                    .fontWeight(.semibold)
                  Text(taskModel.extractDate(date: day, format: "EEE"))
                    .font(.system(size: 14))
                  Circle()
                    .fill(.white)
                    .frame(width: 8, height: 8)
                    .opacity(taskModel.isToday(date: day) ? 1 : 0)
                }
                .foregroundColor(taskModel.isToday(date: day) ? .white : .black)
                .frame(width: 45, height: 90)
                .background (
                  ZStack {
                    if taskModel.isToday(date: day) {
                      Capsule()
                        .fill(.black)
                        .matchedGeometryEffect(id: "CURRENTDAY", in: animation)
                    }
                  }
                )
                .contentShape(Capsule())
                .onTapGesture {
                  withAnimation {
                    taskModel.currentDay = day
                  }
                }
              }
            }
            .padding(.horizontal)
          }
          tasksView()
        } header: {
          headerView()
        }
      }
    }
  }
  
  func tasksView() -> some View {
    LazyVStack (spacing: 20) {
      if let tasks = taskModel.storedTasks {
        if tasks.isEmpty {
          Text("No tasks found!")
            .font(.system(size: 16))
            .fontWeight(.light)
            .offset(y: 100)
        } else {
          ForEach(tasks) { task in
            taskCardView(task: task)
          }
        }
      } else {
        ProgressView()
          .offset(y: 100)
      }
    }
    .padding()
    .padding(.top)
    .onChange(of: taskModel.currentDay) { newValue in
      taskModel.filterTodayTasks()
    }
  }
  
  func taskCardView(task: ATask) -> some View {
    HStack(alignment: .top, spacing: 30) {
      VStack(spacing: 10) {
        Circle()
          .fill(taskModel.isCurrentHour(date: task.taskDate) ? .black : .clear)
          .frame(width: 15, height: 15)
          .background {
            Circle()
              .stroke(.black, lineWidth: 1)
              .padding(-3)
          }
          .scaleEffect(!taskModel.isCurrentHour(date: task.taskDate) ? 0.8 : 1)
        Rectangle()
          .fill(.black)
          .frame(width: 3)
      }
      
      VStack {
        HStack(alignment: .top, spacing: 10) {
          VStack(alignment: .leading, spacing: 12) {
            Text(task.taskTitle)
              .font(.title2.bold())
            Text(task.taskDescription)
              .font(.callout)
              .foregroundStyle(.secondary)
          }
          .hLeading()
          Text(task.taskDate.formatted(date: .omitted, time: .shortened))
        }
        
        if taskModel.isCurrentHour(date: task.taskDate) {
          HStack(spacing: 0) {
            HStack(spacing: -10) {
              ForEach(
                ["User1", "User2", "User3"], id: \.self
              ) { user in
                Image(user)
                  .resizable()
                  .aspectRatio(contentMode: .fill)
                  .frame(width: 45, height: 45)
                  .clipShape(Circle())
                  .background {
                    Circle()
                      .stroke(.black, lineWidth: 5)
                  }
              }
            }
            .hLeading()
            
            Button {
              //
            } label: {
              Image(systemName: "checkmark")
                .foregroundStyle(.black)
                .padding(10)
                .background(Color.white, in: RoundedRectangle(cornerRadius: 10))
            }
          }
          .padding(.top)
        }
      }
      .foregroundColor(taskModel.isCurrentHour(date: task.taskDate) ? .white : .black)
      .padding(taskModel.isCurrentHour(date: task.taskDate) ? 15 : 0)
      .padding(.bottom, taskModel.isCurrentHour(date: task.taskDate) ? 0 : 10)
      .hLeading()
      .background {
        Color.black
          .cornerRadius(25)
          .opacity(taskModel.isCurrentHour(date: task.taskDate) ? 1 : 0)
      }
    }
    .hLeading()
  }
  
  func headerView() -> some View {
    HStack(spacing: 10) {
      VStack(alignment: .leading, spacing: 10) {
        Text(Date().formatted(date: .abbreviated, time: .omitted))
          .foregroundColor(.gray)
      }
      .hLeading()
      
      Button {
        //
      } label: {
        Image("Profile")
          .resizable()
          .aspectRatio(contentMode: .fill)
          .frame(width: 45, height: 45)
          .clipShape(Circle())
      }
    }
    .padding()
  }
}

extension View{
  
  func hLeading()->some View{
    self
      .frame(maxWidth: .infinity,alignment: .leading)
  }
  
  func hTrailing()->some View{
    self
      .frame(maxWidth: .infinity,alignment: .trailing)
  }
  
  func hCenter()->some View{
    self
      .frame(maxWidth: .infinity,alignment: .center)
  }
  
  // MARK: Safe Area
  func getSafeArea()->UIEdgeInsets{
    guard let screen = UIApplication.shared.connectedScenes.first as? UIWindowScene else{
      return .zero
    }
    
    guard let safeArea = screen.windows.first?.safeAreaInsets else{
      return .zero
    }
    
    return safeArea
  }
}

struct TaskManager_Previews: PreviewProvider {
  static var previews: some View {
    TaskManager()
  }
}

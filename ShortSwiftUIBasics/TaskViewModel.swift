//
//  TaskViewModel.swift
//  ShortSwiftUIBasics
//
//  Created by taha on 12/21/22.
//

import SwiftUI

class TaskViewModel: ObservableObject{
  
  // Sample Tasks
  @Published var storedTasks: [ATask] = [
    
//    Task(taskTitle: "Meeting", taskDescription: "Discuss team task for the day", taskDate: .init(timeIntervalSince1970: 1641645497)),
//    Task(taskTitle: "Icon set", taskDescription: "Edit icons for team task for next week", taskDate: .init(timeIntervalSince1970: 1641649097)),
    ATask(taskTitle: "Prototype", taskDescription: "Make and send prototype", taskDate: .init(timeIntervalSince1970: 1641652697)),
    ATask(taskTitle: "Check asset", taskDescription: "Start checking the assets", taskDate: .init(timeIntervalSince1970: 1641656297)),
    ATask(taskTitle: "Team party", taskDescription: "Make fun with team mates", taskDate: .init(timeIntervalSince1970: 1641661897)),
    ATask(taskTitle: "Client Meeting", taskDescription: "Explain project to clinet", taskDate: .init(timeIntervalSince1970: 1641641897)),
    
    ATask(taskTitle: "Next Project", taskDescription: "Discuss next project with team", taskDate: .init(timeIntervalSince1970: 1641677897)),
    ATask(taskTitle: "App Proposal", taskDescription: "Meet client for next App Proposal", taskDate: .init(timeIntervalSince1970: 1641681497)),
  ]
  
  // MARK: Current Week Days
  @Published var currentWeek: [Date] = []
  
  // MARK: Current Day
  @Published var currentDay: Date = Date()
  
  // MARK: Filtering Today Tasks
  @Published var filteredTasks: [ATask]?
  
  // MARK: Intializing
  init(){
    fetchCurrentWeek()
    filterTodayTasks()
  }
  
  // MARK: Filter Today Tasks
  func filterTodayTasks(){
    
    DispatchQueue.global(qos: .userInteractive).async {
      
      let calendar = Calendar.current
      
      let filtered = self.storedTasks.filter{
        return calendar.isDate($0.taskDate, inSameDayAs: self.currentDay)
      }
        .sorted { task1, task2 in
          return task2.taskDate < task1.taskDate
        }
      
      DispatchQueue.main.async {
        withAnimation{
          self.filteredTasks = filtered
        }
      }
    }
  }
  
  func fetchCurrentWeek(){
    
    let today = Date()
    let calendar = Calendar.current
    
    let week = calendar.dateInterval(of: .weekOfMonth, for: today)
    
    guard let firstWeekDay = week?.start else{
      return
    }
    
    (0..<7).forEach { day in
      
      if let weekday = calendar.date(byAdding: .day, value: day, to: firstWeekDay){
        currentWeek.append(weekday)
      }
    }
  }
  
  // MARK: Extracting Date
  func extractDate(date: Date,format: String)->String{
    let formatter = DateFormatter()
    
    formatter.dateFormat = format
    
    return formatter.string(from: date)
  }
  
  // MARK: Checking if current Date is Today
  func isToday(date: Date)->Bool{
    
    let calendar = Calendar.current
    
    return calendar.isDate(currentDay, inSameDayAs: date)
  }
  
  // MARK: Checking if the currentHour is task Hour
  func isCurrentHour(date: Date)->Bool{
    
    let calendar = Calendar.current
    
    let hour = calendar.component(.hour, from: date)
    let currentHour = calendar.component(.hour, from: Date())
    
    return hour == currentHour
  }
}

// Task Model
struct ATask: Identifiable{
  var id = UUID().uuidString
  var taskTitle: String
  var taskDescription: String
  var taskDate: Date
}


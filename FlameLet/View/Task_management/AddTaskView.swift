//
//  AddTaskView.swift
//  DouBanDemo
//
//  Created by Keyu LI on 28/9/2022.
//

import SwiftUI

struct AddTaskView: View {
    @EnvironmentObject var taskManager:TaskManager
    @State var taskTitle:String = ""
    @Environment(\.dismiss) var dismiss
    @Binding var currentDate:Date
//    @State var date:Date = Date()
    var body: some View {
        
        VStack(alignment: .leading, spacing: 20){
            Text("Create a new task")
                .font(.title3.bold())
                .frame(maxWidth:.infinity, alignment: .leading)
            
            TextField("Enter your task here!", text: $taskTitle)
                .textFieldStyle(.roundedBorder)
            
            
            Button{
                if taskTitle != "" {
                    taskManager.addTask(taskTitile: taskTitle, date: currentDate)
                }
                dismiss()
                
            }label: {
                Text("Submit")
                    .foregroundColor(.white)
                    .padding()
                    .padding(.horizontal)
                    .background(.green)
            }
            Spacer()
        }
        .padding(.top, 40)
        .padding(.horizontal)
//        .background(.gray) 
            
            
        
    }
}

struct AddTaskView_Previews: PreviewProvider {
    static var previews: some View {
//        AddTaskView()
        ContentView()
    }
}

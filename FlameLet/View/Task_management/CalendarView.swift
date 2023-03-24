//
//  CalendarView.swift
//  DouBanDemo
//
//  Created by Keyu LI on 26/9/2022.
//

import SwiftUI

struct CalendarView: View {
    @EnvironmentObject var taskManager:TaskManager
    @EnvironmentObject var projectManager:ProjectManager
//    @StateObject var taskViewModel:TaskViewModel = TaskViewModel()
    //date the you choose on the calender
    @Binding var currentDate: Date
    
    @State var currentMonth: Int = 0
    var body: some View {
        VStack(spacing:25){
            
            // week days
            let days:[String] = ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"]
            
            HStack(spacing:20){

                Button{
                    withAnimation{
                        currentMonth -= 1
                    }
                }label: {
                    Image(systemName: "chevron.left")
                        .font(.title2)
                }
                
                Spacer(minLength: 0)
                
                Text(extraDate()[1])
                    .font(.title3)
                
                Text(extraDate()[0])
                    .font(.title3)
                    .fontWeight(.semibold)

                Spacer(minLength: 0)
                    
               
                
                Button{
                    withAnimation{
                        currentMonth += 1
                    }
                }label: {
                    Image(systemName: "chevron.right")
                        .font(.title2)
                }
            }
            .padding(.horizontal)
            
            
            HStack(spacing:0){
                ForEach(days, id:\.self){day in
                    Text("\(day)")
                        .font(.callout)
                        .fontWeight(.semibold)
                        .frame(maxWidth:.infinity)
                }
            }
            
            let columns = Array(repeating: GridItem(.flexible()), count: 7)
            
            LazyVGrid(columns: columns, spacing: 15){
                ForEach(extractDate()){value in
                    
                    cardView(value: value)
                        .background(
                            //show the background color with capsule shap
                            Capsule()
                                .fill(.pink)
                                .padding(.horizontal, 8)
                                .opacity(taskManager.isSameDay(date1: value.date, date2: currentDate) ? 1 : 0)
                        )
                        .onTapGesture {
                            currentDate = value.date
                        }

                    
                }
            }
            
            VStack(spacing: 15){
                Text("Tasks")
                    .font(.title2.bold())
                    .foregroundColor(.orange)
                    .frame(maxWidth:.infinity, alignment: .leading)
                    .padding(.vertical,10)
                
                showTask()

            }
            .padding()
//            .padding(.top)
            
            VStack(spacing: 15){
                Text("Porjets")
                    .font(.title2.bold())
                    .foregroundColor(.orange)
                    .frame(maxWidth:.infinity, alignment: .leading)
                    .padding(.vertical,10)
                
                showProject()

            }
            .padding()
//            .padding(.top,20)
        }
        .onChange(of:currentMonth){newValue in
            //update month
            currentDate = getCurrentMonth()

        }
    }
    @ViewBuilder
    func cardView(value: CalendarDate)->some View{
        VStack{
            if value.day != -1{
                
                //if tasks date is same with current printing date in the calender, add pink point under the date
                if let project = projectManager.projects.first(where: { project in
                    return projectManager.withinDuration(currentDate: value.date, startDate: project.startDate, dueDate: project.endDate)
                }){
                    Text("\(value.day)")
                        .font(.title3.bold())
                        .foregroundColor(projectManager.withinDuration(currentDate: currentDate, startDate: project.startDate, dueDate: project.endDate) ? .gray : .primary)
                        .frame(maxWidth:.infinity)
                        
                    Spacer()
                    
                    Circle()
                        .fill(projectManager.withinDuration(currentDate: currentDate, startDate: project.startDate, dueDate: project.endDate) ? .green : .pink)
                        .frame(width: 8, height: 8)
                }else{
                    Text("\(value.day)")
                        .font(.title3.bold())
                        .foregroundColor(projectManager.isSameDay(date1:value.date, date2: currentDate) ? .white : .primary)
                        .frame(maxWidth:.infinity)
                    Spacer()
                }
            }
        }
        .padding(.vertical, 9)
        .frame(height: 50, alignment: .top)
    }
    
//    @ViewBuilder
//    func cardView(value: CalendarDate)->some View{
//        VStack{
//            if value.day != -1{
//
//                //if tasks date is same with current printing date in the calender, add pink point under the date
//                if let task = taskManager.tasks.first(where: { task in
//                    return taskManager.isSameDay(date1: task.taskDate, date2: value.date)
//                }){
//                    Text("\(value.day)")
//                        .font(.title3.bold())
//                        .foregroundColor(taskManager.isSameDay(date1: task.taskDate, date2: currentDate) ? .white : .primary)
//                        .frame(maxWidth:.infinity)
//
//                    Spacer()
//
//                    Circle()
//                        .fill(taskManager.isSameDay(date1: task.taskDate, date2: currentDate) ? .white : .pink)
//                        .frame(width: 8, height: 8)
//                }else{
//                    Text("\(value.day)")
//                        .font(.title3.bold())
//                        .foregroundColor(taskManager.isSameDay(date1:value.date, date2: currentDate) ? .white : .primary)
//                        .frame(maxWidth:.infinity)
//                    Spacer()
//                }
//            }
//        }
//        .padding(.vertical, 9)
//        .frame(height: 50, alignment: .top)
//    }
//
    @ViewBuilder
    func showTask()->some View{
//        List {
            ForEach(taskManager.tasks){ task in
                if taskManager.isSameDay(date1: task.taskDate, date2: currentDate){
                    SingleTaskView(task: task)
                        .background(.gray)
                    //press task to modify the completed state
                        .onTapGesture {
                            taskManager.updateTask(id: task.id, complete: !task.complete)
                        }
                    //press task for 0.1 second, the task will be deleted
                        .onLongPressGesture(minimumDuration: 0.1) {
                            
                            taskManager.deleteTask(id: task.id)
                                    
                        }
                }
            }
    }
    
    
    @ViewBuilder
    func showProject()->some View{
//        List {
        ForEach(projectManager.projects){ project in
            let show = projectManager.withinDuration(currentDate: currentDate, startDate: project.startDate, dueDate: project.endDate)
            if show{
                SingleProjectView(project: project)
                    .background(.gray)
                //press task to modify the completed state
                    .onTapGesture {
                        projectManager.updateProject(id: project.id, complete: !project.complete)
                    }
                //press task for 0.1 second, the task will be deleted
                    .onLongPressGesture(minimumDuration: 0.1) {

                        projectManager.deleteProject(id: project.id)
                                
                    }
                }
            }
    }
     
    //get current year and month for display
    func extraDate()->[String]{
        let formatter = DateFormatter()
        formatter.dateFormat = "YYYY MMMM"
        
        let date = formatter.string(from: currentDate)
        
        return date.components(separatedBy: " ")
    }
    
    
    func getCurrentMonth() ->Date{
        let calendar = Calendar.current
        
        guard let currentMonth = calendar.date(byAdding: .month, value:self.currentMonth, to: Date()) else{
            return Date()
        }
        return currentMonth
    }
    
    
    func extractDate()->[CalendarDate]{
        let calendar = Calendar.current
        
        let currentMonth = getCurrentMonth()
        
        var days = currentMonth.getAllDates().compactMap{ date -> CalendarDate in
            let day = calendar.component(.day, from: date)
            
            return CalendarDate(day: day, date: date)
        }
        
        // adding offset days to get exact week day
        let firstWeekday = calendar.component(.weekday, from: days.first?.date ?? Date())
        
        for _ in 0..<firstWeekday - 1{
            days.insert(CalendarDate(day: -1, date: Date()), at:0)
        }
        return days
    }
}
struct CalendarView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()

    }
}

extension Date{
    func getAllDates() ->[Date]{
        let calendar = Calendar.current
        
        let startDate = calendar.date(from: Calendar.current.dateComponents([.year,.month],from: self))!
        
        let range = calendar.range(of: .day, in: .month, for: startDate)!
        
        return range.compactMap { day -> Date in

            return calendar.date(byAdding: .day, value: day - 1, to: startDate)!
        }
    }
}

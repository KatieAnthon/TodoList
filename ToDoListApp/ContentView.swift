//
//  ContentView.swift
//  ToDoListApp
//
//  Created by Katie-Rose Anthonisz on 13/02/2024.
//

import SwiftUI

struct ContentView: View {
    @State private var newTask = ""
    @State private var tasks = [String]()
    @State var taskDone: [Bool] = []
    
    var body: some View {
        NavigationView {
            List {
                Section(header: Text("Add New Task")) {
                    TextField("Add your task", text: $newTask)
                    Button("Add Task") {
                        guard !newTask.isEmpty else {return}
                        tasks.append(newTask)
                        taskDone.append(false)
                        newTask = ""
                        
                    }
                }
                
                VStack {
                    Image("to-do-list-artinya")
                        .resizable()
                        .frame(height: 200)
                    
                    HStack{
                        Text("Todo List!")
                            .fontWeight(.light)
                            .font(.system(size: 30))
                        
                        Text("Toggle them all off!")
                            .fontWeight(.light)
                            .font(.system(size: 15))
                    }
                    
                    
                    ForEach(tasks.indices, id: \.self) { index in
                        NavigationLink(destination: NameDisplayView(newTask: tasks[index])) {
                            //Toggle(tasks[index], isOn: $taskDone[index])
                            HStack {
                                Text(tasks[index])
                                Spacer()
                                Toggle("", isOn: $taskDone[index])
                                    .labelsHidden()
                            }
                            
                        }
                        
                        
                        
                    }
                }
                .navigationBarTitle("Task Names")
                .padding()
            }
        }
    }
    
}

#Preview{
    ContentView()
}

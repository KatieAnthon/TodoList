//
//  ContentView.swift
//  ToDoListApp
//
//  Created by Katie-Rose Anthonisz on 13/02/2024.
//

import SwiftUI

struct ContentView: View {
    @State var timesBeingTapped = 0
    @State private var newTask = ""
    @State var tasks: [String] = []
    @State var taskDone: [Bool] = []
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Add New Task")) {
                    TextField("Add your task", text: $newTask)
                    Button("Add Task") {
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
                        Toggle(tasks[index], isOn: $taskDone[index])
                    }
                    
                    
                    
                }
            }
            .padding()
        }
    }
}

#Preview {
    ContentView()
}

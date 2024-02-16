//
//  ContentView.swift
//  ToDoListApp
//
//  Created by Katie-Rose Anthonisz on 13/02/2024.
//

import SwiftUI


struct TodoItem: Identifiable {
    let id = UUID()
    var task: String
    var description: String
    var taskCompleted: Bool
}

struct ContentView: View {
    @State private var newTask = ""
    @State private var todoItems: [TodoItem] = []
    
    var body: some View {
        NavigationView {
            List {
                Section(header: Text("Add New Task")) {
                    TextField("Add your task", text: $newTask)
                    Button("Add Task") {
                        guard !newTask.isEmpty else {return}
                        let newItem = TodoItem(task: newTask, description: "write description", taskCompleted: false)
                        todoItems.append(newItem)
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
                    
                }
                    Section(header: Text("To-Do List")) {
                        ForEach(todoItems.indices, id: \.self) { index in
                            NavigationLink(destination: NameDisplayView(newTask: todoItems[index].task, tasksDescription: self.binding(for: todoItems[index]))) {
                                HStack {
                                    Text(todoItems[index].task)
                                    Spacer()
                                    Toggle("", isOn: $todoItems[index].taskCompleted)
                                        .labelsHidden()
                                }
                            }
                        }
                    }
                }
                .navigationBarTitle("Task Names")
                .padding()
            }
        }
    
    private func binding(for item: TodoItem) -> Binding<String> {
        guard let index = self.todoItems.firstIndex(where: { $0.id == item.id }) else {
            fatalError("Can't find item in array")
        }
        return $todoItems[index].description
    }
        
    }
    
    #Preview{
        ContentView()
    }
    


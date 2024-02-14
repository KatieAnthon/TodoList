//
//  NameDisplayView.swift
//  ToDoListApp
//
//  Created by Katie-Rose Anthonisz on 14/02/2024.
//

import Foundation
import SwiftUI


struct NameDisplayView: View {
    var newTask: String
    var tasksDescription: String
    
    var body: some View {
        VStack{
            Text("Your Task \(newTask)")
                .font(.title)
                .padding()
                
            
            Text("\(tasksDescription)")
                .font(.body)
                .padding()
            
            Spacer()
            
            Button(action: {
                            // Add your edit action here
                        }) {
                            Text("Edit")
                                .padding()
                                .background(Color.blue)
                                .foregroundColor(.white)
                                .cornerRadius(8)
                        }
        }
        .navigationTitle("Task Details")
    }
}

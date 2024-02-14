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
    
        var body: some View {
            Text("Your Task \(newTask)")
                .navigationTitle("Task")
        }
    }

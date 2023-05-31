//
//  TaskItemView.swift
//  SwiftUITodo
//
//  Created by Suyeol Jeon on 03/06/2019.
//  Copyright © 2019 Suyeol Jeon. All rights reserved.
//

import SwiftUI

struct TaskItemView: View {
    @Environment(\.editMode) var editMode
    
    @Binding var task: Task
    
    var body: some View {
        return HStack {
            NavigationLink(value: task) {
                HStack {
                    Text(task.title)
                    Spacer()
                    Toggle(isOn: $task.isDone) {
                        Image(systemName: "checkmark")
                    }
                    .toggleStyle(.button)
                }
            }
        }
    }
}

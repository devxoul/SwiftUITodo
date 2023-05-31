//
//  TaskListView.swift
//  SwiftUITodo
//
//  Created by Suyeol Jeon on 03/06/2019.
//  Copyright © 2019 Suyeol Jeon. All rights reserved.
//

import SwiftUI

struct TaskListView: View {
    @ObservedObject var userData: UserData
    @State var draftTitle: String = ""
    
    var body: some View {
        List {
            TextField("Create a New Task...", text: $draftTitle)
                .onSubmit {
                    createTask()
                }
            ForEach(self.$userData.tasks) { $task in
                TaskItemView(task: $task)
            }
            .onDelete { offsets in
                userData.tasks.remove(atOffsets: offsets)
            }
        }
        .navigationDestination(for: Task.self) { task in
            TaskEditView(task: task)
                .environmentObject(self.userData)
        }
        .navigationBarTitle("Tasks 👀")
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                EditButton()
            }
        }
    }
    
    private func createTask() {
        let newTask = Task(title: self.draftTitle, isDone: false)
        self.userData.tasks.insert(newTask, at: 0)
        self.draftTitle = ""
    }
}

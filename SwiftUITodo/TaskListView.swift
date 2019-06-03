//
//  TaskListView.swift
//  SwiftUITodo
//
//  Created by Suyeol Jeon on 03/06/2019.
//  Copyright © 2019 Suyeol Jeon. All rights reserved.
//

import SwiftUI

struct TaskListView: View {
  @EnvironmentObject var userData: UserData
  @State var draftTitle: String = ""
  @State var isEditing: Bool = false

  var body: some View {
    List {
      if !self.isEditing {
        HStack {
          TextField($draftTitle, placeholder: Text("Create a New Task..."), onCommit: self.createTask)
        }
      }

      ForEach(self.userData.tasks.identified(by: \.self)) { task in
        HStack {
          if self.isEditing {
            Image(systemName: "minus.circle")
              .foregroundColor(.red)
              .tapAction(count: 1) {
                self.delete(task: task)
              }
          }
          Button(action: { self.toggleDone(of: task) }) {
            Text(task.title)
          }
          Spacer()
          if task.isDone {
            Image(systemName: "checkmark").foregroundColor(.green)
          }
        }
      }
    }
    .navigationBarItem(title: Text("Tasks"))
    .navigationBarItems(trailing: Button(action: { self.isEditing.toggle() }) {
      if !self.isEditing {
        Text("Edit")
      } else {
        Text("Done")
      }
    })
  }

  private func createTask() {
    let newTask = Task(title: self.draftTitle, isDone: false)
    self.userData.tasks.insert(newTask, at: 0)
    self.draftTitle = ""
  }

  private func toggleDone(of task: Task) {
    guard !self.isEditing else { return }
    guard let index = self.userData.tasks.firstIndex(where: { $0.id == task.id }) else { return }
    self.userData.tasks[index].isDone.toggle()
  }

  private func delete(task: Task) {
    self.userData.tasks.removeAll(where: { $0.id == task.id })
    if self.userData.tasks.isEmpty {
      self.isEditing = false
    }
  }
}

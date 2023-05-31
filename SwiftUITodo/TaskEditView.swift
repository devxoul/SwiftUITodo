//
//  TaskEditView.swift
//  SwiftUITodo
//
//  Created by Suyeol Jeon on 03/06/2019.
//  Copyright © 2019 Suyeol Jeon. All rights reserved.
//

import SwiftUI

struct TaskEditView: View {
    @EnvironmentObject var userData: UserData
    @State private var draftTitle: String = ""
    
    private let task: Task
    
    enum Field: Equatable {
        case title
    }
    
    init(task: Task) {
        self.task = task
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            TextField("Enter new title...", text: $draftTitle)
                .textFieldStyle(.roundedBorder)
                .padding()
                .onSubmit { self.updateTask() }
            
            Spacer()
        }
        .onAppear {
            draftTitle = task.title
        }
        .navigationBarTitle(Text("Edit Task 📝"))
    }
    
    private func updateTask() {
        guard let index = self.userData.tasks.firstIndex(of: self.task) else { return }
        self.userData.tasks[index].title = self.draftTitle
    }
}

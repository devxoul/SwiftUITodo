//
//  UserData.swift
//  SwiftUITodo
//
//  Created by Suyeol Jeon on 03/06/2019.
//  Copyright © 2019 Suyeol Jeon. All rights reserved.
//

import Combine
import SwiftUI

private let defaultTasks: [Task] = [
    Task(title: "Read SwiftUI Documentation 📚", isDone: false),
    Task(title: "Watch WWDC19 Keynote 🎉", isDone: true),
]

final class UserData: ObservableObject {
    
    @Published var tasks = [Task]() {
        didSet {
            // Update to user default
            userDefaultTasks = tasks
        }
    }
    
    @UserDefaultValue(key: "Tasks", defaultValue: defaultTasks)
    private var userDefaultTasks: [Task]
    
    init() {
        tasks = self.userDefaultTasks
    }
}

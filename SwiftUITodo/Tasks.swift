//
//  Tasks.swift
//  SwiftUITodo
//
//  Created by Chris Martin on 5/31/23.
//  Copyright © 2023 Suyeol Jeon. All rights reserved.
//

import Foundation

struct Tasks: Codable {
    var tasks: [Task]
    
    static var `default` = Tasks(
        tasks: [
            Task(title: "Read SwiftUI Documentation 📚", isDone: false),
            Task(title: "Watch WWDC19 Keynote 🎉", isDone: true),
        ]
    )
}

extension Tasks: RawRepresentable {
    init?(rawValue: String) {
        guard let tasks = try? JSONDecoder().decode([Task].self, from: rawValue.data(using: .utf8)!)
        else { return nil }
        
        self = Tasks(tasks: tasks)
    }
    
    var rawValue: String {
        String(data: try! JSONEncoder().encode(tasks), encoding: .utf8)!
    }
}

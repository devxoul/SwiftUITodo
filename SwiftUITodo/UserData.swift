//
//  UserData.swift
//  SwiftUITodo
//
//  Created by Suyeol Jeon on 03/06/2019.
//  Copyright © 2019 Suyeol Jeon. All rights reserved.
//

import Combine
import SwiftUI

final class UserData: ObservableObject {
    
    @AppStorage("Tasks")
    var storage: Tasks = .default
    
    var tasks: [Task] {
        get { storage.tasks }
        set { storage.tasks = newValue }
    }
}

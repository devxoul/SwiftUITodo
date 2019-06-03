//
//  Task.swift
//  SwiftUITodo
//
//  Created by Suyeol Jeon on 03/06/2019.
//  Copyright © 2019 Suyeol Jeon. All rights reserved.
//

import SwiftUI

struct Task: Equatable, Hashable {
  let id: UUID = UUID()
  var title: String
  var isDone: Bool
}

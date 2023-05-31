//
//  UserDefaultsValue.swift
//  SwiftUITodo
//
//  Created by kemchenj on 2019/6/5.
//  Copyright © 2019 Suyeol Jeon. All rights reserved.
//

import Foundation

@propertyWrapper
class UserDefaultValue<Value: Codable>: ObservableObject {
    
    let key: String
    let defaultValue: Value
    
    init(wrappedValue: Value, key: String) {
        self.key = key
        self.defaultValue = wrappedValue
    }
    
    var wrappedValue: Value {
        get {
            let data = UserDefaults.standard.data(forKey: key)
            let value = data.flatMap { try? JSONDecoder().decode(Value.self, from: $0) }
            return value ?? defaultValue
        }
        set {
            let data = try? JSONEncoder().encode(newValue)
            UserDefaults.standard.set(data, forKey: key)
        }
    }
}

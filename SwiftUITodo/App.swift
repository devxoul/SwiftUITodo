import Foundation
import SwiftUI

@main
struct SwiftUITodo: App {
    @StateObject var userData = UserData()
    
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                TaskListView(userData: userData)
            }
        }
    }
}

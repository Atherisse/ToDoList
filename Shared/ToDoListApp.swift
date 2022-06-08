//
//  ToDoListApp.swift
//  Shared
//
//  Created by user217621 on 6/3/22.
//

import SwiftUI

@main
struct ToDoListApp: App {
    
    @StateObject var listViewModel:ListViewModel = ListViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationView{
                ListView()
            }
            .environmentObject(listViewModel)
        }
    }
}


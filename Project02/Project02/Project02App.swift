//
//  Project02App.swift
//  Project02
//
//  Created by meister on 2021/02/19.
//

import SwiftUI

@main
struct Project02App: App {
    let persistenceController = PersistenceController.shared
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}

//
//  PenguinClickerApp.swift
//  PenguinClicker
//
//  Created by Michael Mathews on 11/14/23.
//

import SwiftUI

@main
struct PenguinClickerApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            StartMenu()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}

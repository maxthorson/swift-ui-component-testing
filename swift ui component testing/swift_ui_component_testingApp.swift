//
//  swift_ui_component_testingApp.swift
//  swift ui component testing
//
//  Created by Max Thorson on 4/13/26.
//

import SwiftUI
import CoreData

@main
struct swift_ui_component_testingApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}

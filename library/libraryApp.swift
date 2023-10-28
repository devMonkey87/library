//
//  libraryApp.swift
//  library
//
//  Created by Jose Antonio Landete Muñoz on 28/10/23.
//

import SwiftUI

@main
struct libraryApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}

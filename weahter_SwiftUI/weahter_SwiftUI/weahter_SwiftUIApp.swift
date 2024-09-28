//
//  weahter_SwiftUIApp.swift
//  weahter_SwiftUI
//
//  Created by 서준영 on 9/22/24.
//

import SwiftUI

@main
struct weahter_SwiftUIApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}

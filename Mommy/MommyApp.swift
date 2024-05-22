//
//  MommyApp.swift
//  Mommy
//
//  Created by Bruna Veiga Chalegre de Lira on 13/05/24.
//

import SwiftUI
import SwiftData

@main
struct MommyApp: App {
    var body: some Scene {
        
//        let container: ModelContainer = {
//            let schema = Schema([Atividade.self])
//            let container = try! ModelContainer (for: schema, configurations: [])
//            return container
//        }()
        
        WindowGroup {
            ContentView()
        }
        //.modelContainer(container)
        .modelContainer(for: [Atividade.self])
    }
}

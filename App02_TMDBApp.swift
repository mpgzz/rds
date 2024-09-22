//
//  App02_TMDBApp.swift
//  App02-TMDB
//
//  Created by Μιτχελλ on 20/08/24.
//

import SwiftUI
import SwiftData

@main
struct App02_TMDBApp: App {
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            Item.self,
            Fav.self
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()
    
    @State var moviesData: MoviesData = MoviesData()

    var body: some Scene {
        WindowGroup {
            MoviesView()
                .environment(moviesData)
        }
        .modelContainer(sharedModelContainer)
    }
}

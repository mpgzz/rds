//
//  MoviesView.swift
//  App02-TMDB
//
//  Created by Μιτχελλ on 21/08/24.
//

import SwiftUI

struct MoviesView: View {
    
    var body: some View {
        NavigationStack {
            TabView {
                MoviesListView()
                    .tabItem {
                        Label("Movies", systemImage: "film")
                    }
                FavsListView()
                    .tabItem {
                        Label("Favorites", systemImage: "star.fill")
                    }
            }
           
        }
       
        
    }
}

#Preview {
    MoviesView()
        .environment(MoviesData())
}

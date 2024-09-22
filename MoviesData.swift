//
//  MoviesData.swift
//  App02-TMDB
//
//  Created by Μιτχελλ on 20/08/24.
//

import Foundation

@Observable
class MoviesData {
    
    var movies: [Movie] = []
    
    func fetchMovies() async {
        
        let url = URL(string: "https://api.themoviedb.org/3/movie/now_playing")!
        var components = URLComponents(url: url, resolvingAgainstBaseURL: true)!
        let queryItems: [URLQueryItem] = [
          URLQueryItem(name: "language", value: "en-US"),
          URLQueryItem(name: "page", value: "1"),
        ]
        components.queryItems = components.queryItems.map { $0 + queryItems } ?? queryItems

        var request = URLRequest(url: components.url!)
        request.httpMethod = "GET"
        request.timeoutInterval = 10
        request.allHTTPHeaderFields = [
          "accept": "application/json",
          "Authorization": "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJlYzUxMWUxOTQwNmI0MDNjZmNkMmNhZjUwNTM3ODMwYiIsIm5iZiI6MTcyNDExNTM0Ni41MzAyMjQsInN1YiI6IjViZjM1YjEyMGUwYTI2MjY1YzA5MjcyZCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.Ew9MIiZXNQTzFSXFnSRjT9ozlfmfL-v_Gh63qu4KLvM"
        ]

//        let (data) = try await URLSession.shared.data(for: request)
//        print(String(decoding: data, as: UTF8.self))
        do {
            let (data, _) = try await URLSession.shared.data(for: request)
            print(String(decoding: data, as: UTF8.self))
            if let decodedResponse = try? JSONDecoder().decode(MoviesResults.self, from: data) {
                movies = decodedResponse.results
                print(movies.count)
            }

            
        } catch {
            print("Invalid data")
        }
    }
    
}

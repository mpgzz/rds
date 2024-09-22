//
//  Model.swift
//  App02-TMDB
//
//  Created by Μιτχελλ on 20/08/24.
//

import Foundation

struct Movie: Identifiable, Codable {
    var adult: Bool
    var backdropPath: String
    var genreIds: [Int]
    var id: Int
    var originalLanguage: String
    var originalTitle: String
    var overview: String
    var popularity: Double
    var posterPath: String
    var releaseDate: String
    var title: String
    var video: Bool
    var voteAverage: Double
    var voteCount: Int

    enum CodingKeys: String, CodingKey {
        case adult
        case backdropPath = "backdrop_path"
        case genreIds = "genre_ids"
        case id
        case originalLanguage = "original_language"
        case originalTitle = "original_title"
        case overview
        case popularity
        case posterPath = "poster_path"
        case releaseDate = "release_date"
        case title
        case video
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
    }

}

extension Movie {
    
    static var defaultMovie = Movie(adult: false, backdropPath: "/yDHYTfA3R0jFYba16jBB1ef8oIt.jpg", genreIds: [28,35,878], id: 533535, originalLanguage: "en", originalTitle: "Deadpool Wolverine", overview: "A listless Wade Wilson toils away in civilian life with his days as the morally flexible mercenary, Deadpool, behind him. But when his homeworld faces an existential threat, Wade must reluctantly suit-up again with an even more reluctant Wolverine.", popularity: 8858.912, posterPath: "/8cdWjvZQUExUUTzyp4t6EDMubfO.jpg", releaseDate: "2024-07-24", title: "Deadpool Wolverine", video: false, voteAverage: 7.8, voteCount: 2095)
    
}

//
//  MoviesPosterView.swift
//  App02-TMDB
//
//  Created by Μιτχελλ on 21/08/24.
//

import SwiftUI
import Kingfisher
import SwiftData

struct MoviePosterView: View {
    
    @Environment(\.modelContext) private var modelContext
    var movie: Movie
    @Query
    private var favs: [Fav]
    
    init(movie: Movie) {
        self._favs = Query(filter: #Predicate<Fav> { $0.id == movie.id })
        self.movie = movie
    }
    
    
    
    var body: some View {
        VStack {
            KFImage.url(URL(string: "https://image.tmdb.org/t/p/original\(movie.posterPath)"))
                .cacheMemoryOnly()
                .fade(duration: 0.25)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 150)
                .overlay(
                    VStack {
                        HStack {
                            Spacer()
                            Image(systemName: favs.count == 0 ? "star" : "star.fill")
                                .padding(.top, 10)
                                .padding(.trailing, 10)
                                .foregroundStyle(.yellow)
                                .font(.system(size: 40))
                                .onTapGesture {
                                    if favs.count == 0 {
                                        print("Guardar")
                                        // guardar
                                        let newFav = Fav(id: movie.id, title: movie.title, overview: movie.overview, posterPath: movie.posterPath, backdropPath: movie.backdropPath, genreIds: movie.genreIds, originalLanguage: movie.originalLanguage, originalTitle: movie.originalTitle, popularity: movie.popularity, releaseDate: movie.releaseDate, voteAverage: movie.voteAverage, voteCount: movie.voteCount)
                                        modelContext.insert(newFav)
                                    } else {
                                        for fav in favs {
                                            modelContext.delete(fav)
                                        }
                                    }
                                }
                        }
                        Spacer()
                    }
                )
        }
    }
}

#Preview {
    MoviePosterView(movie: Movie.defaultMovie)
}

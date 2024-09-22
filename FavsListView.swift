import SwiftUI
import SwiftData

struct FavsListView: View {
    
    @Environment(\.modelContext) private var modelContext
    @Query
    private var favs: [Fav]
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.blue
                List {
                    ForEach(favs) { fav in
                        let movie = Movie(adult: false, backdropPath: fav.backdropPath, genreIds: fav.genreIds, id: fav.id, originalLanguage: fav.originalLanguage, originalTitle: fav.originalTitle, overview: fav.overview, popularity: fav.popularity, posterPath: fav.posterPath, releaseDate: fav.releaseDate, title: fav.title, video: false, voteAverage: fav.voteAverage, voteCount: fav.voteCount)
                        HStack {
                            Text(fav.title)
                            Spacer()
                            MoviePosterView(movie: movie)
                        }
                    }
                }
                .navigationTitle("Favourites")
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .principal) {
                        Text("Favourites")
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(.black)
                    }
                }
            }
        }
    }
}

#Preview {
    FavsListView()
}

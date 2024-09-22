import SwiftUI
import Kingfisher

struct MoviesListView: View {
    
    @Environment(MoviesData.self) var moviesData
    
    var body: some View {
        NavigationView {
            TabView {
                ForEach(moviesData.movies) { movie in
                    VStack {
                        ZStack {
                            Color.blue
                            RoundedRectangle(cornerRadius: 20)
                                .fill(Color.red)
                                .frame(width: 240, height: 350)
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(Color.blue.opacity(0.4), lineWidth: 15)
                                .frame(width: 240, height: 350)

                            VStack {
                                MoviePosterView(movie: movie)
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 200, height: 300)
                                    .clipped()

                                Text(movie.title)
                                    .font(.custom("Times New Roman", size: 25))
                                    .fontWeight(.bold)
                                    .foregroundColor(.white)
                                    .multilineTextAlignment(.center)
                                    .padding(.horizontal)
                            }
                            .frame(maxWidth: 300)
                        }
                    }
                    .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
                }
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("Movies")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                       
                }
            }
            
        }
    
        .onAppear {
            Task {
                await moviesData.fetchMovies()
             
                let appearance = UINavigationBarAppearance()
                appearance.configureWithOpaqueBackground()
                appearance.backgroundColor = UIColor(red: 0.68, green: 0.85, blue: 0.9, alpha: 1.0)
               
                
            
                UINavigationBar.appearance().standardAppearance = appearance
                UINavigationBar.appearance().scrollEdgeAppearance = appearance
               
            }
        }
    }
}

#Preview {
    MoviesListView()
        .environment(MoviesData())
}

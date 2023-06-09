//
//  MovieDetailView.swift
//  Netflix Clone
//
//  Created by A Farhan Agustiansyah on 13/05/23.
//

import SwiftUI

struct MovieDetailView: View {
    
    let movieId: Int
    let movieTitle: String
    @StateObject private var movieDetailState = MovieDetailState()
    @State private var selectedTrailerURL: URL?
    
    var body: some View {
        List {
            if let movie = movieDetailState.movie {
                MovieDetailImage(imageURL: movie.backdropURL)
                    .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                    .listRowSeparator(.hidden)
                
                MovieDetailListView(movie: movie, selectedTrailerURL: $selectedTrailerURL)
            }
        }
        .listStyle(.plain)
        .task(loadMovie)
        .overlay(DataFetchPhaseOverlayView(
            phase: movieDetailState.phase,
            retryAction: loadMovie)
        )
        .sheet(item: $selectedTrailerURL) { SafariView(url: $0).edgesIgnoringSafeArea(.bottom)}
        .navigationTitle(movieTitle)
    }
    
    @Sendable
    private func loadMovie() {
        Task { await self.movieDetailState.loadMovie(id: self.movieId) }
    }
}

struct MovieDetailListView: View {
    
    let movie: Movie
    @Binding var selectedTrailerURL: URL?
    
    // MARK: Custom Button Properties
    @State var isLiked: [Bool] = [false, false, false]
    
    var body: some View {
        movieDescriptionSection.listRowSeparator(.visible)
        movieCastSection.listRowSeparator(.hidden)
        movieTrailerSection
    }
    
    // MARK: Custom Button View
    @ViewBuilder
    func CustomButton(systemImage: String, status: Bool, activeTint: Color, inActiveTint: Color, onTap: @escaping () -> ()) -> some View {
        
        Button(action: onTap) {
            
            Image(systemName: systemImage)
                .font(.title2)
                .particleEffect(
                    systemImage: systemImage,
                    font: .title2,
                    status: status,
                    activeTint: activeTint,
                    inActiveTint: inActiveTint
                )
                .foregroundColor(status ? activeTint : inActiveTint)
                .padding(.horizontal, 18)
                .padding(.vertical, 8)
                .background {
                    Capsule()
                        .fill(status ? activeTint.opacity(0.25) : Color("ButtonColor"))
                }
            
        }
        
    }
    
    private var movieDescriptionSection: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text(movieGenreYearDurationText)
                .font(.headline)
            Text(movie.overview)
            HStack {
                if !movie.ratingText.isEmpty {
                    Text(movie.ratingText).foregroundColor(.yellow)
                }
                Text(movie.scoreText)
            }
        }
        .padding(.vertical)
    }
    
    private var movieCastSection: some View {
        HStack(alignment: .top, spacing: 4) {
            if let cast = movie.cast, !cast.isEmpty {
                VStack(alignment: .leading, spacing: 4) {
                    Text("Starring").font(.headline)
                    ForEach(cast.prefix(9)) { Text($0.name) }
                }
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                Spacer()
                
            }
            
            if let crew = movie.crew, !crew.isEmpty {
                VStack(alignment: .leading, spacing: 4) {
                    if let directors = movie.directors, !directors.isEmpty {
                        Text("Director(s)").font(.headline)
                        ForEach(directors.prefix(2)) { Text($0.name) }
                    }
                    
                    if let producers = movie.producers, !producers.isEmpty {
                        Text("Producer(s)").font(.headline)
                            .padding(.top)
                        ForEach(producers.prefix(2)) { Text($0.name) }
                    }
                    
                    if let screenwriters = movie.screenWriters, !screenwriters.isEmpty {
                        Text("Screenwriter(s)").font(.headline)
                            .padding(.top)
                        ForEach(screenwriters.prefix(2)) { Text($0.name) }
                    }
                }
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
            }
        }
        .padding(.vertical)
    }
    
    @ViewBuilder
    private var movieTrailerSection: some View {
        if let trailers = movie.youtubeTrailers, !trailers.isEmpty {
            Text("Trailers").font(.headline)
            ForEach(trailers) { trailer in
                Button(action: {
                    guard let url = trailer.youtubeURL else { return }
                    selectedTrailerURL = url
                }) {
                    HStack {
                        Text(trailer.name)
                        Spacer()
                        Image(systemName: "play.circle.fill")
                            .foregroundColor(Color("Red"))
                    }
                }
            }
        }
    }
    
    
    private var movieGenreYearDurationText: String {
        "\(movie.genreText) · \(movie.yearText) · \(movie.durationText)"
    }
}

struct MovieDetailImage: View {
    
    @StateObject private var imageLoader = ImageLoader()
    let imageURL: URL
    
    var body: some View {
        ZStack {
            Color.gray.opacity(0.3)
            if let image = imageLoader.image {
                Image(uiImage: image)
                    .resizable()
            }
        }
        .aspectRatio(16/9, contentMode: .fit)
        .onAppear { imageLoader.loadImage(with: imageURL) }
    }
}

extension URL: Identifiable {
    
    public var id: Self { self }
}

struct MovieDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            MovieDetailView(movieId: Movie.stubbedMovie.id, movieTitle: "The Godfather 2")
        }
    }
}

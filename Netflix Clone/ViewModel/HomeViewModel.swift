//
//  HomeViewModel.swift
//  Netflix Clone
//
//  Created by A Farhan Agustiansyah on 12/05/23.
//

import Foundation

final class HomeViewModel: ObservableObject {
    
    @Published var movies: [String: [Movie]] = [:]
    
    public var allCategories: [String] {
        return movies.keys.map({ String($0) })
    }
    
    init() {
        setData()
    }
    
    public func getMoviesByCategory(category: String) -> [Movie] {
        return movies[category] ?? []
    }
    
    public func setData() {
        movies["Recently Added"] = exampleMovies.shuffled()
        movies["Trending Now"] = exampleMovies.shuffled()
        movies["Popular on Netflix"] = exampleMovies.shuffled()
    }
    
}

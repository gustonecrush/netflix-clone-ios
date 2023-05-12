//
//  Movie.swift
//  Netflix Clone
//
//  Created by A Farhan Agustiansyah on 12/05/23.
//

import Foundation

struct Movie: Identifiable {
    
    let id: String
    let name: String
    let thumbnail: String
    let categories: [String]
    
}

extension Movie {
    
    static let dummyMovie = Movie(id: UUID().uuidString, name: "The Last Dance".uppercased(), thumbnail: "https://alternativemovieposters.com/wp-content/uploads/2020/05/javierhueto_lastdance.jpg", categories: ["Fell Good"])
    
}

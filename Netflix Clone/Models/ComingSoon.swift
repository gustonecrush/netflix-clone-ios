//
//  ComingSoon.swift
//  Netflix Clone
//
//  Created by A Farhan Agustiansyah on 12/05/23.
//

import SwiftUI

// MARK: Data Model and Sample Data
struct ComingSoon: Identifiable, Equatable {
    var id = UUID().uuidString
    var appName: String
    var appDescription: String
    var genre: String
    var duration: String
    var platformTitle: String
    var artwork: String
    var trailer: String
    var status: Bool
    var status2: Bool?
    var status3: Bool?
}

var comingSoonItems: [ComingSoon] = [

    ComingSoon(appName: "LEGO Brawls", appDescription: "Battle with friends online", genre: "Logo1", duration: "Smash your rivals in LEGO Brawls", platformTitle: "Apple Arcade", artwork: "Post1", trailer: "https://www.themoviedb.org/video/play?key=BmllggGO4pM", status: false),
    ComingSoon(appName: "LEGO Brawls", appDescription: "Battle with friends online", genre: "Logo1", duration: "Smash your rivals in LEGO Brawls", platformTitle: "Apple Arcade", artwork: "Post2", trailer: "https://www.themoviedb.org/video/play?key=BmllggGO4pM", status: false),

]

var comingSoons: [ComingSoon] = [

    ComingSoon(appName: "1", appDescription: "Battle with friends online", genre: "Logo1", duration: "Smash your rivals in LEGO Brawls", platformTitle: "Apple Arcade", artwork: "cs1", trailer: "https://www.themoviedb.org/video/play?key=BmllggGO4pM", status: false),
    ComingSoon(appName: "2", appDescription: "Battle with friends online", genre: "Logo1", duration: "Smash your rivals in LEGO Brawls", platformTitle: "Apple Arcade", artwork: "cs2", trailer: "https://www.themoviedb.org/video/play?key=BmllggGO4pM", status: false),
    ComingSoon(appName: "3", appDescription: "Battle with friends online", genre: "Logo1", duration: "Smash your rivals in LEGO Brawls", platformTitle: "Apple Arcade", artwork: "cs3", trailer: "https://www.themoviedb.org/video/play?key=BmllggGO4pM", status: false),
    ComingSoon(appName: "4", appDescription: "Battle with friends online", genre: "Logo1", duration: "Smash your rivals in LEGO Brawls", platformTitle: "Apple Arcade", artwork: "cs4", trailer: "https://www.themoviedb.org/video/play?key=BmllggGO4pM", status: false),
    ComingSoon(appName: "5", appDescription: "Battle with friends online", genre: "Logo1", duration: "Smash your rivals in LEGO Brawls", platformTitle: "Apple Arcade", artwork: "cs5", trailer: "https://www.themoviedb.org/video/play?key=BmllggGO4pM", status: false),
    ComingSoon(appName: "6", appDescription: "Battle with friends online", genre: "Logo1", duration: "Smash your rivals in LEGO Brawls", platformTitle: "Apple Arcade", artwork: "cs6", trailer: "https://www.themoviedb.org/video/play?key=BmllggGO4pM", status: false),
    ComingSoon(appName: "7", appDescription: "Battle with friends online", genre: "Logo1", duration: "Smash your rivals in LEGO Brawls", platformTitle: "Apple Arcade", artwork: "cs7", trailer: "https://www.themoviedb.org/video/play?key=BmllggGO4pM", status: false),
    ComingSoon(appName: "8", appDescription: "Battle with friends online", genre: "Logo1", duration: "Smash your rivals in LEGO Brawls", platformTitle: "Apple Arcade", artwork: "cs8", trailer: "https://www.themoviedb.org/video/play?key=BmllggGO4pM", status: false),
    

]


var favorites: [ComingSoon] = [

    ComingSoon(appName: "Gray Man", appDescription: "When a shadowy CIA agent uncovers damning agency secrets, he's hunted across the globe by a sociopathic rogue operative who's put a bounty on his head.", genre: "Action, Thriller", duration: "2h 8m", platformTitle: "Apple Arcade", artwork: "poster1", trailer: "https://www.themoviedb.org/video/play?key=BmllggGO4pM", status: false, status2: false, status3: false),
    ComingSoon(appName: "Extraction", appDescription: "Tyler Rake, a fearless mercenary who offers his services on the black market, embarks on a dangerous mission when he is hired to rescue the kidnapped son of a Mumbai crime lord.", genre: "Drama, Action, Thriller", duration: "1h 56m", platformTitle: "Apple Arcade", artwork: "poster2", trailer: "https://www.themoviedb.org/video/play?key=BmllggGO4pM", status: false, status2: false, status3: false),
    ComingSoon(appName: "The Adam Project", appDescription: "After accidentally crash-landing in 2022, time-traveling fighter pilot Adam Reed teams up with his 12-year-old self on a mission to save the future.", genre: "Adventure, Science Fiction", duration: "1h 46m", platformTitle: "Apple Arcade", artwork: "poster3", trailer: "https://www.themoviedb.org/video/play?key=BmllggGO4pM", status: false, status2: false, status3: false),
    ComingSoon(appName: "The Queen Gambit", appDescription: "In a Kentucky orphanage in the 1950s, a young girl discovers an astonishing talent for chess while struggling with addiction.", genre: "Drama", duration: "9 Eps", platformTitle: "Apple Arcade", artwork: "poster4", trailer: "https://www.themoviedb.org/video/play?key=BmllggGO4pM", status: false, status2: false, status3: false),
    ComingSoon(appName: "Peaky Blinders", appDescription: "A gangster family epic set in 1919 Birmingham, England and centered on a gang who sew razor blades in the peaks of their caps, and their fierce boss Tommy Shelby, who means to move up in the world.", genre: "Drama, Crime", duration: "58m", platformTitle: "Apple Arcade", artwork: "poster5", trailer: "https://www.themoviedb.org/video/play?key=BmllggGO4pM", status: false, status2: false, status3: false),
    ComingSoon(appName: "Enola Holmes 2", appDescription: "Now a detective-for-hire like her infamous brother, Enola Holmes takes on her first official case to find a missing girl, as the sparks of a dangerous conspiracy ignite a mystery that requires the help of friends — and Sherlock himself — to unravel.", genre: "Adventure, Mystery, Comedy, Crime", duration: "2h 9m", platformTitle: "Apple Arcade", artwork: "poster6", trailer: "https://www.themoviedb.org/video/play?key=BmllggGO4pM", status: false, status2: false, status3: false),
    ComingSoon(appName: "DOTA Dragon's Blood", appDescription: "After encounters with a dragon and a princess on her own mission, a Dragon Knight becomes embroiled in events larger than he could have ever imagined.", genre: "Sci-Fi & Fantasy, Action & Adventure, Animation", duration: "25m", platformTitle: "Apple Arcade", artwork: "poster7", trailer: "https://www.themoviedb.org/video/play?key=BmllggGO4pM", status: false, status2: false, status3: false),
    ComingSoon(appName: "The Witcher", appDescription: "Geralt of Rivia, a mutated monster-hunter for hire, journeys toward his destiny in a turbulent world where people often prove more wicked than beasts.", genre: "Drama, Action & Adventure, Sci-Fi & Fantasy", duration: "1h", platformTitle: "Apple Arcade", artwork: "poster8", trailer: "https://www.themoviedb.org/video/play?key=BmllggGO4pM", status: false, status2: false, status3: false),
    

]

var drakors: [ComingSoon] = [

    ComingSoon(appName: "1", appDescription: "Battle with friends online", genre: "Logo1", duration: "Smash your rivals in LEGO Brawls", platformTitle: "Apple Arcade", artwork: "drakor1", trailer: "https://www.themoviedb.org/video/play?key=BmllggGO4pM", status: false),
    ComingSoon(appName: "2", appDescription: "Battle with friends online", genre: "Logo1", duration: "Smash your rivals in LEGO Brawls", platformTitle: "Apple Arcade", artwork: "drakor2", trailer: "https://www.themoviedb.org/video/play?key=BmllggGO4pM", status: false),
    ComingSoon(appName: "3", appDescription: "Battle with friends online", genre: "Logo1", duration: "Smash your rivals in LEGO Brawls", platformTitle: "Apple Arcade", artwork: "drakor3", trailer: "https://www.themoviedb.org/video/play?key=BmllggGO4pM", status: false),
    ComingSoon(appName: "4", appDescription: "Battle with friends online", genre: "Logo1", duration: "Smash your rivals in LEGO Brawls", platformTitle: "Apple Arcade", artwork: "drakor4", trailer: "https://www.themoviedb.org/video/play?key=BmllggGO4pM", status: false),
    ComingSoon(appName: "5", appDescription: "Battle with friends online", genre: "Logo1", duration: "Smash your rivals in LEGO Brawls", platformTitle: "Apple Arcade", artwork: "drakor5", trailer: "https://www.themoviedb.org/video/play?key=BmllggGO4pM", status: false),
    ComingSoon(appName: "6", appDescription: "Battle with friends online", genre: "Logo1", duration: "Smash your rivals in LEGO Brawls", platformTitle: "Apple Arcade", artwork: "drakor6", trailer: "https://www.themoviedb.org/video/play?key=BmllggGO4pM", status: false),
    
]

var animes: [ComingSoon] = [

    ComingSoon(appName: "1", appDescription: "Battle with friends online", genre: "Logo1", duration: "Smash your rivals in LEGO Brawls", platformTitle: "Apple Arcade", artwork: "anime1", trailer: "https://www.themoviedb.org/video/play?key=BmllggGO4pM", status: false),
    ComingSoon(appName: "2", appDescription: "Battle with friends online", genre: "Logo1", duration: "Smash your rivals in LEGO Brawls", platformTitle: "Apple Arcade", artwork: "anime2", trailer: "https://www.themoviedb.org/video/play?key=BmllggGO4pM", status: false),
    ComingSoon(appName: "3", appDescription: "Battle with friends online", genre: "Logo1", duration: "Smash your rivals in LEGO Brawls", platformTitle: "Apple Arcade", artwork: "anime3", trailer: "https://www.themoviedb.org/video/play?key=BmllggGO4pM", status: false),
    ComingSoon(appName: "4", appDescription: "Battle with friends online", genre: "Logo1", duration: "Smash your rivals in LEGO Brawls", platformTitle: "Apple Arcade", artwork: "anime4", trailer: "https://www.themoviedb.org/video/play?key=BmllggGO4pM", status: false),
    ComingSoon(appName: "5", appDescription: "Battle with friends online", genre: "Logo1", duration: "Smash your rivals in LEGO Brawls", platformTitle: "Apple Arcade", artwork: "anime5", trailer: "https://www.themoviedb.org/video/play?key=BmllggGO4pM", status: false),
    
]

var trendings: [ComingSoon] = [

    ComingSoon(appName: "LEGO Brawls", appDescription: "Battle with friends online", genre: "Logo1", duration: "Smash your rivals in LEGO Brawls", platformTitle: "Apple Arcade", artwork: "One", trailer: "https://www.themoviedb.org/video/play?key=BmllggGO4pM", status: false),
    ComingSoon(appName: "LEGO Brawls", appDescription: "Battle with friends online", genre: "Logo1", duration: "Smash your rivals in LEGO Brawls", platformTitle: "Apple Arcade", artwork: "Two", trailer: "https://www.themoviedb.org/video/play?key=BmllggGO4pM", status: false),
    ComingSoon(appName: "LEGO Brawls", appDescription: "Battle with friends online", genre: "Logo1", duration: "Smash your rivals in LEGO Brawls", platformTitle: "Apple Arcade", artwork: "Three", trailer: "https://www.themoviedb.org/video/play?key=BmllggGO4pM", status: false),
    ComingSoon(appName: "LEGO Brawls", appDescription: "Battle with friends online", genre: "Logo1", duration: "Smash your rivals in LEGO Brawls", platformTitle: "Apple Arcade", artwork: "Four", trailer: "https://www.themoviedb.org/video/play?key=BmllggGO4pM", status: false),
    ComingSoon(appName: "LEGO Brawls", appDescription: "Battle with friends online", genre: "Logo1", duration: "Smash your rivals in LEGO Brawls", platformTitle: "Apple Arcade", artwork: "Five", trailer: "https://www.themoviedb.org/video/play?key=BmllggGO4pM", status: false),
    ComingSoon(appName: "LEGO Brawls", appDescription: "Battle with friends online", genre: "Logo1", duration: "Smash your rivals in LEGO Brawls", platformTitle: "Apple Arcade", artwork: "Six", trailer: "https://www.themoviedb.org/video/play?key=BmllggGO4pM", status: false),

]

//
//  ComingSoon.swift
//  Netflix Clone
//
//  Created by A Farhan Agustiansyah on 12/05/23.
//

import SwiftUI

// MARK: Data Model and Sample Data
struct ComingSoon: Identifiable {
    var id = UUID().uuidString
    var appName: String
    var appDescription: String
    var appLogo: String
    var bannerTitle: String
    var platformTitle: String
    var artwork: String
}

var comingSoonItems: [ComingSoon] = [

    ComingSoon(appName: "LEGO Brawls", appDescription: "Battle with friends online", appLogo: "Logo1", bannerTitle: "Smash your rivals in LEGO Brawls", platformTitle: "Apple Arcade", artwork: "Post1"),
    ComingSoon(appName: "LEGO Brawls", appDescription: "Battle with friends online", appLogo: "Logo2", bannerTitle: "Smash your rivals in LEGO Brawls", platformTitle: "Apple Arcade", artwork: "Post2"),

]


var favorites: [ComingSoon] = [

    ComingSoon(appName: "LEGO Brawls", appDescription: "Battle with friends online", appLogo: "Logo1", bannerTitle: "Smash your rivals in LEGO Brawls", platformTitle: "Apple Arcade", artwork: "poster1"),
    ComingSoon(appName: "LEGO Brawls", appDescription: "Battle with friends online", appLogo: "Logo2", bannerTitle: "Smash your rivals in LEGO Brawls", platformTitle: "Apple Arcade", artwork: "poster2"),
    ComingSoon(appName: "LEGO Brawls", appDescription: "Battle with friends online", appLogo: "Logo1", bannerTitle: "Smash your rivals in LEGO Brawls", platformTitle: "Apple Arcade", artwork: "poster3"),
    ComingSoon(appName: "LEGO Brawls", appDescription: "Battle with friends online", appLogo: "Logo2", bannerTitle: "Smash your rivals in LEGO Brawls", platformTitle: "Apple Arcade", artwork: "poster4"),
    ComingSoon(appName: "LEGO Brawls", appDescription: "Battle with friends online", appLogo: "Logo1", bannerTitle: "Smash your rivals in LEGO Brawls", platformTitle: "Apple Arcade", artwork: "poster5"),
    ComingSoon(appName: "LEGO Brawls", appDescription: "Battle with friends online", appLogo: "Logo2", bannerTitle: "Smash your rivals in LEGO Brawls", platformTitle: "Apple Arcade", artwork: "poster6"),
    ComingSoon(appName: "LEGO Brawls", appDescription: "Battle with friends online", appLogo: "Logo1", bannerTitle: "Smash your rivals in LEGO Brawls", platformTitle: "Apple Arcade", artwork: "poster7"),
    ComingSoon(appName: "LEGO Brawls", appDescription: "Battle with friends online", appLogo: "Logo2", bannerTitle: "Smash your rivals in LEGO Brawls", platformTitle: "Apple Arcade", artwork: "poster8"),
    

]

var trendings: [ComingSoon] = [

    ComingSoon(appName: "LEGO Brawls", appDescription: "Battle with friends online", appLogo: "Logo1", bannerTitle: "Smash your rivals in LEGO Brawls", platformTitle: "Apple Arcade", artwork: "One"),
    ComingSoon(appName: "LEGO Brawls", appDescription: "Battle with friends online", appLogo: "Logo2", bannerTitle: "Smash your rivals in LEGO Brawls", platformTitle: "Apple Arcade", artwork: "Two"),
    ComingSoon(appName: "LEGO Brawls", appDescription: "Battle with friends online", appLogo: "Logo1", bannerTitle: "Smash your rivals in LEGO Brawls", platformTitle: "Apple Arcade", artwork: "Three"),
    ComingSoon(appName: "LEGO Brawls", appDescription: "Battle with friends online", appLogo: "Logo2", bannerTitle: "Smash your rivals in LEGO Brawls", platformTitle: "Apple Arcade", artwork: "Four"),
    ComingSoon(appName: "LEGO Brawls", appDescription: "Battle with friends online", appLogo: "Logo1", bannerTitle: "Smash your rivals in LEGO Brawls", platformTitle: "Apple Arcade", artwork: "Five"),
    ComingSoon(appName: "LEGO Brawls", appDescription: "Battle with friends online", appLogo: "Logo2", bannerTitle: "Smash your rivals in LEGO Brawls", platformTitle: "Apple Arcade", artwork: "Six"),

]

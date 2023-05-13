//
//  Particle.swift
//  Netflix Clone
//
//  Created by A Farhan Agustiansyah on 13/05/23.
//

import SwiftUI

// MARK: Particle Model
struct Particle: Identifiable {
    
    var id: UUID = .init()
    var randomX: CGFloat = 0
    var randomY: CGFloat = 0
    var scale: CGFloat = 1
    
    // MARK: Optional
    var opacity: CGFloat = 1
    
    // MARK: Reset's All Properties
    mutating func reset() {
        randomX = 0
        randomY = 0
        scale = 1
        opacity = 1
    }
    
}

//
//  HomeScreen.swift
//  Netflix Clone
//
//  Created by A Farhan Agustiansyah on 12/05/23.
//

import SwiftUI

struct HomeScreen: View {
    
    @State var selectedTab = "circle.grid.2x2"
    
    var body: some View {
        
        ZStack(alignment: .bottom, content: {
            
            Color("BG")
                .ignoresSafeArea()
            
            // MARK: Tab Bar
            TabBar(selectedTab: $selectedTab)
            
        })
        
    }
}

struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen()
    }
}

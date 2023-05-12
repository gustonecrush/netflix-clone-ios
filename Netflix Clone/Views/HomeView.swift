//
//  HomeView.swift
//  Netflix Clone
//
//  Created by A Farhan Agustiansyah on 12/05/23.
//

import SwiftUI

struct HomeView: View {
    
    let viewModel = HomeViewModel()
    
    var body: some View {
        NavigationView {
            ZStack {
                Color("BG")
                    .ignoresSafeArea(.all)
                
                ScrollView {
                    LazyVStack {
                        ZStack {
                            // TODO: - Top Movie
                        }
                    }
                    
                    ForEach(viewModel.allCategories, id: \.self) { category in
                        VStack {
                            HStack {
                                Text(category)
                                Spacer()
                            }
                            
                            ScrollView(.horizontal, showsIndicators: false) {
                                
                                LazyHStack {
                                    
                                    ForEach(viewModel.getMoviesByCategory(category: category)) { movie in
                                        
                                        // TODO: - Widget
                                        
                                    }
                                    
                                }
                                
                            }
                        }
                    }
                }
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

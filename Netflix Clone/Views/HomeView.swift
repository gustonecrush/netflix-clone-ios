//
//  HomeView.swift
//  Netflix Clone
//
//  Created by A Farhan Agustiansyah on 12/05/23.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        
        ScrollView(.vertical, showsIndicators: false) {
            
            ZStack {
                Image("Hero")
                    .resizable()
                    .scaledToFill()
                    .frame(height: 550)
            }
            
            // MARK: Watch List
            VStack(spacing: 3) {
                
                HStack(alignment: .bottom) {
                    VStack(alignment: .leading, spacing: 2) {
                        Text("Watch List")
                            .font(.title2.bold())
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                }
                .padding(.horizontal, 25)
                .padding(.bottom, -1)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 15) {
                        ForEach(favorites) { item in
                            CardView(item: item)
                        }
                    }
                    .padding(.horizontal, 25)
                }
                
            }
            .padding(.top, -130)
            
            // MARK: 10 Trending
            VStack(spacing: 3) {
                
                HStack(alignment: .bottom) {
                    VStack(alignment: .leading, spacing: 2) {
                        Text("Top 10 Movies Today")
                            .font(.title2.bold())
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                }
                .padding(.horizontal, 25)
                .padding(.bottom, -1)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 10) {
                        ForEach(trendings) { item in
                            TrendingCard(item: item)
                        }
                    }
                    .padding(.horizontal, 25)
                }
                
            }
            .padding(.top, 25)
            
        }
        .padding(.bottom)
        .background(Color("BG"))
        .preferredColorScheme(.dark)
        .ignoresSafeArea()
        
    }
    
    // MARK: CardView
    @ViewBuilder
    func CardView(item: ComingSoon) -> some View {
        VStack(alignment: .leading, spacing: 15) {
            ZStack(alignment: .topLeading) {
                // Banner Image
                GeometryReader { proxy in
                    let size = proxy.size
                    
                    Image(item.artwork)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: size.width, height: size.height)
                        .cornerRadius(10)
                        .clipped()
                }
                .frame(width: 350, height: 200)
            }
        }
    }
    
    // MARK: CardView
    @ViewBuilder
    func TrendingCard(item: ComingSoon) -> some View {
        VStack(alignment: .leading, spacing: 15) {
            ZStack(alignment: .topLeading) {
                // Banner Image
                GeometryReader { proxy in
                    let size = proxy.size
                    
                    Image(item.artwork)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: size.width, height: size.height)
                        .cornerRadius(10)
                        .clipped()
                }
                .frame(width: 200, height: 200)
            }
        }
    }
    
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

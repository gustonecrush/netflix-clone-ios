//
//  ComingSoonView.swift
//  Netflix Clone
//
//  Created by A Farhan Agustiansyah on 12/05/23.
//

import SwiftUI

struct ComingSoonView: View {
    
    @Namespace var animation
    @StateObject var movieUpcomingState = MovieUpcomingState()
    @StateObject var imageLoader = ImageLoader()
    
    // MARK: Carousel Properties
    @State var currentIndex: Int = 1
    
    var body: some View {
            ScrollView(.vertical, showsIndicators: false) {
                VStack {
                    HStack(alignment: .bottom) {
                        VStack(alignment: .leading, spacing: 8) {
                            Text("WORTH TO WAIT")
                                .font(.callout)
                                .foregroundColor(.gray)
                            Text("Coming Soon")
                                .font(.largeTitle.bold())
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        
                        Button {
                            
                        } label: {
                            Image("user")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 40, height: 40)
                                .cornerRadius(10)
                        }
                    }
                    .padding(.horizontal)
                    
                    // MARK: Custom Carousel
                    CustomCarousel(index: $currentIndex, items: comingSoons, cardPadding: 150, id: \.id) { shoe, cardSize in
                        // MARK: Custom cell view
                        
                        Image(shoe.artwork)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: cardSize.width, height: 400)
                            .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
                    }
                    .padding(.horizontal, -15)
                    .padding(.top, 230)
                    
                }
                .padding(.vertical)
            }
            .background(.black)
    }
    
    @Sendable
        private func loadMovies(invalidateCache: Bool) {
            Task { await movieUpcomingState.loadMoviesFromAllEndpoints(invalidateCache: invalidateCache) }
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
}

struct ComingSoonView_Previews: PreviewProvider {
    static var previews: some View {
        ComingSoonView()
    }
}

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
    @State var showSheet: Bool = false
    @State var movie: ComingSoon = comingSoonItems[0]
    
    // MARK: Carousel Properties
    @State var currentIndex: Int = 0
    
    // MARK: Custom Button Properties
    @State private var isLiked: [Bool] = [false, false, false]
    
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
                    .padding(.top, 235)
                    
                    HStack(spacing: 20) {
                        
                        // MARK: Like Button
                        CustomButton(systemImage: "suit.heart.fill", status: isLiked[0], activeTint: .pink, inActiveTint: .gray) {
                            isLiked[0].toggle()
                        }
                        
                        // MARK: Favorite Button
                        CustomButton(systemImage: "star.fill", status: isLiked[1], activeTint: .yellow, inActiveTint: .gray) {
                            isLiked[1].toggle()
                        }
                        
                        // MARK: Share Button
                        CustomButton(systemImage: "square.and.arrow.up.fill", status: isLiked[2], activeTint: .blue, inActiveTint: .gray) {
                            isLiked[2].toggle()
                        }
                        
                    }
                    .padding(.top, currentIndex == 1 || currentIndex == 3 ? 165 : 165)
                    .opacity(currentIndex == 1 || currentIndex == 3 || currentIndex == 2 || currentIndex == 4 ? 1 : 0)
                    .frame(maxWidth: .infinity)
                    
                }
                .padding(.vertical)
            }
            .background(.black)
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

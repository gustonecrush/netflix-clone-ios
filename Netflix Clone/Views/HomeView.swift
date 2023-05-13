//
//  HomeView.swift
//  Netflix Clone
//
//  Created by A Farhan Agustiansyah on 12/05/23.
//

import SwiftUI

struct HomeView: View {
    
    // MARK: View Properties
    var safeArea: EdgeInsets
    var size: CGSize
    
    @StateObject var videoManager = VideoManager()
    
    @State var showSheet: Bool = false
    @State var movie: ComingSoon = comingSoonItems[0]
    @StateObject private var movieDetailState = MovieDetailState()
    @State private var selectedTrailerURL: URL?
    
    var body: some View {
        
        NavigationView {
            ScrollView(.vertical, showsIndicators: false) {
                
                // MARK: Artwork
                ArtWork()
                    .padding(.bottom, 130)
                    .ignoresSafeArea()
                
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
                                    .onTapGesture {
                                        showSheet.toggle()
                                        movie = item
                                    }
                            }
                        }
                        .padding(.horizontal, 25)
                    }
                    
                }
                .padding(.top, -70)
                
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
                
                // MARK: Korean Drama
                VStack(spacing: 3) {
                    
                    HStack(alignment: .bottom) {
                        VStack(alignment: .leading, spacing: 2) {
                            Text("Korean Drama")
                                .font(.title2.bold())
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                    }
                    .padding(.horizontal, 25)
                    .padding(.bottom, -1)
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 15) {
                            ForEach(drakors) { item in
                                CardView(item: item)
                                    .onTapGesture {
                                        showSheet.toggle()
                                        movie = item
                                    }
                            }
                        }
                        .padding(.horizontal, 25)
                    }
                    
                }
                .padding(.top, 25)
                
                // MARK: Anime
                VStack(spacing: 3) {
                    
                    HStack(alignment: .bottom) {
                        VStack(alignment: .leading, spacing: 2) {
                            Text("Animes")
                                .font(.title2.bold())
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                    }
                    .padding(.horizontal, 25)
                    .padding(.bottom, -1)
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 15) {
                            ForEach(animes) { item in
                                CardView(item: item)
                                    .onTapGesture {
                                        showSheet.toggle()
                                        movie = item
                                    }
                            }
                        }
                        .padding(.horizontal, 25)
                    }
                    
                }
                .padding(.top, 25)
                .padding(.bottom, 80)
                
            }
            .padding(.bottom)
            .background(Color("BG"))
            .overlay(alignment: .top) {
                HeaderView()
            }
            .coordinateSpace(name: "SCROLL")
            .ignoresSafeArea()
            .navigationBarHidden(true)
            .edgesIgnoringSafeArea([.top, .bottom])
            .halfSheet(showSheet: $showSheet) {
                // Your Half Sheet View ...
                ZStack {
                    Color("BG")
                    
//                    VStack {
//                        Button {
//                            showSheet.toggle()
//                        } label: {
//                            Text("Close from sheet")
//                                .foregroundColor(.white)
//                        }
//                        .padding()
//                    }
                    
                }
                .ignoresSafeArea()
            } onEnd: {
                print("Dismissed")
            }
            .preferredColorScheme(.dark)
            
        }
        
    }
    
    // MARK: ControllerView
    @ViewBuilder
    func ControllerView() -> some View {
        GeometryReader { proxy in
            
            HStack {
                Image(systemName: "play.fill")
                    .resizable()
                    .frame(width: 45, height: 50)
                    .opacity(0.9)
            }
            .frame(maxWidth: .infinity)
            
        }
    }
    
    // MARK: HeaderView
    @ViewBuilder
    func HeaderView() -> some View {
        GeometryReader { proxy in
            HStack(spacing: 15) {
                Image("logoPng")
                    .resizable()
                    .frame(width: 40, height: 40)
                
                Spacer(minLength: 0)
                
                HStack(spacing: 13) {
                    
                    Image(systemName: "tv")
                        .resizable()
                        .frame(width: 31, height: 27)
                    
                    Image("user")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 40, height: 40)
                        .cornerRadius(10)
                }
            }
            .padding([.horizontal, .bottom], 20)
            
        }
        .padding(.top, safeArea.top + 10)
        .frame(height: 80)
    }
    
    // MARK: Artwork
    @ViewBuilder
    func ArtWork() -> some View {
        let height = size.height * 0.45
        GeometryReader { proxy in
            let size = proxy.size
            let minY = proxy.frame(in: .named("SCROLL")).minY
            let progress = minY / (height * 0.8)
            
            Image("Hero")
                .resizable()
                .scaledToFill()
                .frame(height: 550)
                .clipped()
                .overlay(content: {
                    ZStack(alignment: .bottom) {
                        ControllerView()
                            .padding(.top, 230)
                        
                        // MARK: Gradient OVerlay
                        Rectangle()
                            .fill(
                                .linearGradient(colors: [
                                    Color("BG").opacity(0 - progress),
                                    Color("BG").opacity(0.1 - progress),
                                    Color("BG").opacity(0.3 - progress),
                                    Color("BG").opacity(0.5 - progress),
                                    Color("BG").opacity(0.8 - progress),
                                    Color("BG").opacity(1),
                                ], startPoint: .top, endPoint: .bottom)
                            )
                    }
                })
                .offset(y: -minY)
        }
        .frame(height: height + safeArea.top)
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
        ContentView()
    }
}

// Custom Half Sheet Modifier ...
extension View {
    
    // Binding Show Variable
    func halfSheet<SheetView: View>(showSheet: Binding<Bool>, @ViewBuilder sheetView: @escaping ()->SheetView, onEnd: @escaping ()->()) -> some View {
        
        // Why we using overlay ...
        // Because it will automatically use the swiftui frame size only ...
        return self
            .background (
                HalfSheetHelper(sheetView: sheetView(), showSheet: showSheet, onEnd: onEnd)
            )
        
    }
    
}


// UIKit Integration ...
struct HalfSheetHelper<SheetView: View>: UIViewControllerRepresentable {
    
    var sheetView: SheetView
    @Binding var showSheet: Bool
    var onEnd: () -> ()
    
    let controller = UIViewController()
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(parent: self)
    }
    
    func makeUIViewController(context: Context) -> UIViewController {
        return controller
    }
    
    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
        
        if showSheet {
            
            // Presenting Modal View ...
            
            let sheetController = CustomHostingController(rootView: sheetView)
            sheetController.presentationController?.delegate = context.coordinator
            uiViewController.present(sheetController, animated: true)
            
        } else {
            
             // closing view when showSheet toggled again ...
            uiViewController.dismiss(animated: true)
            
        }
        
    }
    
    // On Dismiss ...
    class Coordinator: NSObject, UISheetPresentationControllerDelegate {
        var parent: HalfSheetHelper
        
        init(parent: HalfSheetHelper) {
            self.parent = parent
        }
        
        func presentationControllerDidDismiss(_ presentationController: UIPresentationController) {
            parent.showSheet = false
            parent.onEnd()
        }
    }
    
}

// Custom UIHostingController for halfSheet ...
class CustomHostingController<Content: View>: UIHostingController<Content> {
    override func viewDidLoad() {
        
        view.backgroundColor = .clear
        
        // setting presentation controller properties ...
        if let presentationController = presentationController as?
            UISheetPresentationController {
            
            presentationController.detents = [
                .medium(),
                .large()
            ]
            
            // to show grab protion ...
            presentationController.prefersGrabberVisible = true
            
        }
        
    }
}

struct MovieDetailImageHome: View {
    
    let imageURL: String
    
    var body: some View {
        ZStack {
            Color.gray.opacity(0.3)
                Image(imageURL)
                    .resizable()
        }
        .aspectRatio(16/9, contentMode: .fit)
    }
}

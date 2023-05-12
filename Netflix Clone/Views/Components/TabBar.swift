//
//  TabBar.swift
//  Netflix Clone
//
//  Created by A Farhan Agustiansyah on 12/05/23.
//

import SwiftUI

var tabs = ["circle.grid.2x2", "magnifyingglass", "play.tv", "arrow.down.circle", "person"]

struct TabBar: View {
    
    @Binding var selectedTab: String
    
    // Storing Each Tab MidPoints to animate it in future ...
    @State var tabPoints: [CGFloat] = []
    
    var body: some View {
        
        ZStack(alignment: Alignment(horizontal: .center, vertical: .bottom)) {
            
            TabView(selection: $selectedTab) {
                
                HomeView()
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .tag(tabs[0])
                    .background(Color("BG").ignoresSafeArea())
                
                Text("Explore")
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .tag(tabs[1])
                    .background(Color("BG").ignoresSafeArea())
                
                ComingSoonView()
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .tag(tabs[2])
                    .background(Color("BG").ignoresSafeArea())
                
                Text("Downloads")
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .tag(tabs[3])
                    .background(Color("BG").ignoresSafeArea())
                
                Text("Profile")
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .tag(tabs[4])
                    .background(Color("BG").ignoresSafeArea())
                
            }
            
            HStack(spacing: 0, content: {
                
                // Tab Bar Buttons
                TabBarButton(image: "circle.grid.2x2", selectedTab: $selectedTab, tabPoints: $tabPoints)
                
                TabBarButton(image: "magnifyingglass", selectedTab: $selectedTab, tabPoints: $tabPoints)
                
                TabBarButton(image: "play.tv", selectedTab: $selectedTab, tabPoints: $tabPoints)
                
                TabBarButton(image: "arrow.down.circle", selectedTab: $selectedTab, tabPoints: $tabPoints)
                
                TabBarButton(image: "person", selectedTab: $selectedTab, tabPoints: $tabPoints)
                
            })
                .padding()
                .background(Color("BGNavigation").clipShape(TabCurve(tabPoint: getCurvePoint() - 15)))
                .overlay (
                    Circle()
                        .fill(Color("Red"))
                        .frame(width: 10, height: 10)
                        .offset(x: getCurvePoint() - 20)
                    
                    ,alignment: .bottomLeading
                )
                .cornerRadius(30)
                .padding(.horizontal)
            
        }
        
    }
    
    // extracting point ...
    func getCurvePoint() -> CGFloat {
        
        // if tabpoint is empty ...
        if tabPoints.isEmpty {
            return 10
        } else {
            switch selectedTab {
            case "circle.grid.2x2":
                return tabPoints[0]
            case "magnifyingglass":
                return tabPoints[1]
            case "play.tv":
                return tabPoints[2]
            case "arrow.down.circle":
                return tabPoints[3]
            default:
                return tabPoints[4]
            }
        }
        
    }
    
}

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen()
    }
}


struct TabBarButton: View {
    
    let image: String
    @Binding var selectedTab: String
    @Binding var tabPoints: [CGFloat]
    
    var body: some View {
        
        // To getting mid point of each button fur curve animation
        GeometryReader { reader -> AnyView in
            
            // extracting midpoint and storing ...
            let midX = reader.frame(in: .global).midX
            
            DispatchQueue.main.async {
                
                // avoiding junk data ...
                if tabPoints.count <= 4 {
                    tabPoints.append(midX)
                }
                
            }
            
            return AnyView (
            
                Button(action: {
                    
                    // changing tab
                    // spring animation ...
                    withAnimation(.interactiveSpring(response: 0.6, dampingFraction: 0.5, blendDuration: 0.5)) {
                        
                        selectedTab = image
                        
                    }
                    
                }, label: {
                    
                    // Filling the color if it's selected ...
                    
                    Image(systemName: "\(image)\(selectedTab == image && image != "magnifyingglass" ? ".fill" : "")")
                        .font(.system(size: 25, weight: .semibold))
                        .foregroundColor(selectedTab == image ? Color("Red") :  Color("Gray"))
                    // Lifting View ...
                    // If its selected ...
                        .offset(y: selectedTab == image ? -10 : 0)
                    
                })
                // Max frame ...
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                
            )
            
        }
        // Max height
        .frame(height: 50)
        
    }
    
}

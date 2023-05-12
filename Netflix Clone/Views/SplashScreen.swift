//
//  SplashScreen.swift
//  Netflix Clone
//
//  Created by A Farhan Agustiansyah on 12/05/23.
//

import SwiftUI
import SDWebImageSwiftUI

struct SplashScreen: View {
    
    @State var animationFinished: Bool = false
    @State var animationStarted: Bool = false
    @State var removeGIF = false
    
    var body: some View {
        
        ZStack {
            
            HomeScreen()
            
            ZStack {
                
                Color("BG")
                    .ignoresSafeArea()
                
                if !removeGIF {
                    
                    // Overcome ...
                    ZStack {
                        
                        if animationStarted {
                            
                            if animationFinished {
                                
                                // Same extract the first frame and set as launch screen image ...
                                // Displaying the last frame ...
                                // you can easlity extract the last frame by ...
                                Image("logo")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                
                            } else {
                                
                                AnimatedImage(url: getLogoURL())
                                // no use of using loop count to
                                    .aspectRatio(contentMode: .fit)
                                
                            }
                            
                        } else {
                            
                            // Showing first frame ..
                            Image("logoStarting")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                            
                        }
                        
                    }
                    .animation(.none, value: animationFinished)
                    
                }
                
            }
            .opacity(animationFinished ? 0 : 1)
            
        }
        .onAppear {
            
            // Displaying initial start ...
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                
                animationStarted = true
                
                // This gif will take time to complete = 1.2s
                // use online tool to calculate the time seconds ...
                // So closing the splash screen after 1.5s
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                    
                    // Animation has some problems that triggering the girf to reanimate again ...
                    withAnimation(.easeInOut(duration: 0.7)) {
                        animationFinished = true
                    }
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                        removeGIF = true
                    }
                    
                }
                
            }
            
        }
        
    }
    
    func getLogoURL() -> URL {
        let bundle = Bundle.main.path(forResource: "logo", ofType: "gif")
        let url = URL(fileURLWithPath: bundle ?? "")
        
        return url
    }
}

struct SplashScreen_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreen()
    }
}

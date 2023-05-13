//
//  VideoView.swift
//  Netflix Clone
//
//  Created by A Farhan Agustiansyah on 13/05/23.
//

import SwiftUI
import AVKit

struct VideoView: View {
    var video: String
    @State private var player = AVPlayer()

    var body: some View {
        VideoPlayer(player: player)
            .edgesIgnoringSafeArea(.all)
            .onAppear {
                    player = AVPlayer(url: URL(string: video)!)
                    
                    // Play the video
                    player.play()
            }
    }
}

struct VideoView_Previews: PreviewProvider {
    static var previews: some View {
        VideoView(video: "")
    }
}

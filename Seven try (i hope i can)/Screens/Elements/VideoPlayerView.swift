//
//  VideoPlayerView.swift
//  ExtasApp
//
//  Created by MacBook on 19.01.2022.
//

import SwiftUI
import AVKit

struct VideoPlayerView: View {
    
    var mov = Bundle.main.url(forResource: "ExampleExtension", withExtension: "mp4")!
    
    var body: some View {
        VStack
        {
            VideoPlayer(player: AVPlayer(url: mov))
        }
        .ignoresSafeArea()
    }
}

struct VideoPlayerView_Previews: PreviewProvider {
    static var previews: some View {
        VideoPlayerView()
    }
}

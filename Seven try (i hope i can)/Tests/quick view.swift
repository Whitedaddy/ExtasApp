//
//  quick view.swift
//  Seven try (i hope i can)
//
//  Created by Матвей Марюха on 02.11.2021.
//

import SwiftUI

struct quick_view: View
{
    
    @StateObject var Multiple = MultibleSongsCombine ()
    
    var body: some View
    {
        VStack
        {
//            ForEach (Multiple.songs,id: \.self)
//            {   song in
//                VStack
//                {
//                    Text(song.service_name)
//                    Text(song.song_url)
//                        .foregroundColor(Color.red)
//                        .multilineTextAlignment(.center)
//                }
//                .padding()
//            }
        }
//        .onAppear(perform: {Multiple.GetMultipleSongs(songURL: "https://music.yandex.ru/album/4066489/track/33274678")})
    }
}

struct quick_view_Previews: PreviewProvider {
    static var previews: some View {
        quick_view()
    }
}


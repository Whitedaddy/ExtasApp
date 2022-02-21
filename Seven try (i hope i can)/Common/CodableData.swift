//
//  CommonStructs.swift
//  Extas
//
//  Created by MacBook on 19.12.2021.
//

import Foundation
import SwiftUI

// SingleSong
struct ParsedSong: Decodable
{
    var url: String
}
////////////////////////////////////////////////////////////


//TOP
struct ParsedTOP: Decodable
{
    var tracks: [track]
}

struct track: Decodable, Identifiable, Hashable
{
   // var ID: UUID
    let apple_url: String
    let authors: [String]
    let id: Int
    let name: String
    let searched_times: Int
    let spotify_url: String
    let yandex_url: String
    let youtube_url: String
}
////////////////////////////////////////////////////////////

//Multiple Songs
struct ParsedSongs: Decodable
{
    var urls: [Song]
}

struct Song: Decodable, Hashable
{
    let service_name: String
    let song_url: String
}
///////////////////////////////////////////////////////////////////

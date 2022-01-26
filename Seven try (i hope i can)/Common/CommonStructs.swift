//
//  CommonStructs.swift
//  Extas
//
//  Created by MacBook on 19.12.2021.
//

import Foundation
import SwiftUI

struct ParsedSong: Decodable
{
    var url: String
}

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

//
//  URL_Requests.swift
//  Extas
//
//  Created by MacBook on 12.12.2021.
//

import Foundation
import Foundation
import SwiftUI

            //Everything, which is connected with decodind you can find in Common/CommonStructs

public class BackConnection: ObservableObject
{
    //Song Variables
    @Published var OldSongUrl: String = ""
    @Published var NewSongUrl: String = "None"
    
    //Song Buttons
    @Published var MainExchangeButtonOn: Bool = false
    
    //TOP Variables
    @Published var tracksss: [track] = []
    
    //Top Buttons
    @Published var IsTopDownloaded: Bool = false
}

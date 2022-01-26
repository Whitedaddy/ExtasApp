//
//  Seven_try__i_hope_i_can_App.swift
//  Seven try (i hope i can)
//
//  Created by Матвей Марюха on 20.10.2021.
//

import SwiftUI

@main
struct Seven_try__i_hope_i_can_App: App
{
//
//    @StateObject var viewRouter = ViewRouter()
//    @StateObject var platformID = PlatformID ()
    
    
    var body: some Scene
    {
        WindowGroup
        {
//            quick_view()
            MotherView()
                .environmentObject(ViewRouter())
                .environmentObject(PlatformID())
        }
    }
}

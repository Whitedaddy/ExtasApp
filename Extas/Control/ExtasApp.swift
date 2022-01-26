//
//  ExtasApp.swift
//  Extas
//
//  Created by MacBook on 06.12.2021.
//
import SwiftUI

@main
struct Seven_try__i_hope_i_can_App: App
{
    
    @StateObject var viewRouter =  ViewRouter()
    @StateObject var platformID = PlatformID ()
    @StateObject var API = Api ()
    
    var body: some Scene
    {
        WindowGroup
        {
           // testUIView()
          // MotherView().environmentObject(viewRouter)
            MotherView()
                .environmentObject(ViewRouter())
                .environmentObject(PlatformID())
                .environmentObject(Api())
        }
    }
}


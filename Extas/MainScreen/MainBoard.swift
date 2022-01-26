//
//  MainBoard.swift
//  Seven try (i hope i can)
//
//  Created by Матвей Марюха on 25.10.2021.
//

import SwiftUI
import UIKit



struct MainBoard: View
{
    @EnvironmentObject var viewRouter: ViewRouter
    let colors = Gradient(colors: [.white, .black])
   // @State var SelectedTab = 1

    
    var body: some View
    {
        let gradient = RadialGradient(gradient: colors, center: .center, startRadius: 0, endRadius: 60)
        ZStack
        {
            //FAQ Show
            if viewRouter.currentPage == .page4
            {
                Terms_and_Policy()
            }
            
            //MainBoard
            else
            {
                VStack
            {
                ZStack
                {
                    switch viewRouter.SelectedTab
                    {
                    case "TOP":
                        Text("TOP")
                            .font(Font.custom("Rawer-CondensedThin", size: 35))
                    case "Search":
                        SearchSongView()
                    case "Settings":
                        Settings()
                    default:
                        Text("")
                    }
                }
                .foregroundColor(.white)
                .background(Image("backgroundReady"))
                Spacer ()
                ZStack
                {
                    HStack
                    {
                        Button (action: {viewRouter.SelectedTab = "TOP"})
                        {
                            if viewRouter.SelectedTab == "TOP"
                            {
                                Image ("CrownWhite")
                                    .resizable ()
                                    .frame(width: 100, height: 100)
                                // .padding(-10)
                            }
                            else
                            {
                                Image ("CrownWhite")
                                    .resizable ()
                                    .frame(width: 100, height: 100)
                                    .opacity(0.3)
                                // .padding(-10)
                            }
                        }
                        Spacer()
                        Button (action: {viewRouter.SelectedTab = "Settings"})
                        {
                            if viewRouter.SelectedTab == "Settings"
                            {
                                Image ("GearWhite")
                                    .resizable ()
                                    .frame(width: 100, height: 100)
                                    .foregroundColor(.gray)
                                // .padding(-10)
                            }
                            else
                            {
                                Image ("GearWhite")
                                    .resizable ()
                                    .frame(width: 100, height: 100)
                                    .opacity(0.3)
                                // .padding(-10)
                            }
                        }
                    }
                    .background(Color(.black))
                    
                    Button (action: {viewRouter.SelectedTab = "Search"})
                    {
                        ZStack
                        {
                            if viewRouter.SelectedTab == "Search"
                            {
                                Circle().fill(gradient)
                                    .frame(width: 95, height: 95)
                                    .opacity(0.2)
                                
                            }
                            
                            Image ("Link")
                                .resizable ()
                                .frame(width: 170, height: 170)
                                .opacity(0.7)
                                .padding(-30)
                        }
                    }
                    .offset(y:-10)
                    
                }
            }
            .foregroundColor(Color("MyWhiteColor"))
            .font(Font.custom("Rawer-CondensedThin", size: 25))
            }
        }
    }
}

struct MainBoard_Previews: PreviewProvider
{
    static var previews: some View
    {
        MainBoard()
            .environmentObject(ViewRouter())
            .environmentObject(PlatformID())
    }
}


//struct MainBoard: View
//{
//    @State var SongLink = ""
//    @EnvironmentObject var viewRouter: ViewRouter
//    @EnvironmentObject var platformID: PlatformID
//
//    var body: some View
//    {
//
//        TabView
//        {
//            Text ("TOP Artists")
//                .padding()
//                .font(.system(size: 30))
//                .background(Color.purple.opacity(0.3))
//                .tabItem
//                {
//                    Image (systemName: "star")
//                    Text ("TOP")
//                }
//            VStack
//            {
//                SearchSongView().environmentObject(platformID)
//            }
//                .tabItem
//            {
//                Image (systemName: "loupe")
//                Text ("Search")
//            }
//
//            Settings().environmentObject(platformID)
//                .tabItem
//            {
//                Image (systemName: "wrench")
//                Text ("Settings")
//            }
//        }
//        .environmentObject(platformID)
//        .accentColor(.purple)
//        .onAppear()
//    }
//}

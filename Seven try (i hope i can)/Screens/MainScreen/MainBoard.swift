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
        ZStack
        {
            
                ZStack
                {
                    switch viewRouter.SelectedTab
                    {
                    case "Link":
                        SearchSongView()
                    case "Crown":
                        TOPScreen()
                    case "Gear":
                        Settings()
                            //.frame(width: Get_Width(w: 1), height: Get_Height(h: 0.9))
                    default:
                        SearchSongView()
                    }
                }
            
            
                
                VStack
                {
                    Spacer()
                    
                    MainTabBar()
                }
                .ignoresSafeArea()
        }
        //.ignoresSafeArea(.keyboard, edges: .bottom)
        .foregroundColor(Color.white)
        .font(Font.custom("Rawer-CondensedThin", size: Get_Height(h: 0.03)))
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





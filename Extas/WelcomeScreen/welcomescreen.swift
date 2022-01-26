//
//  welcomescreen.swift
//  Seven try (i hope i can)
//
//  Created by Матвей Марюха on 23.10.2021.
//

import SwiftUI

struct welcomescreen: View
{
    @EnvironmentObject var viewRouter: ViewRouter
    var body: some View
    {
        TabView
        {
            ContentView()
            NewUpdate()
            VStack
            {
            Description1().environmentObject(ViewRouter())
                Button (action: withAnimation
                        { {viewRouter.currentPage = .page2}})
                {
                    Text ("Start")
                       // .padding
                        .font(Font.custom("Rawer-CondensedThin", size: 30))
                        .shadow(color: Color("MyWhiteColor"), radius: 10, x: 0, y: 0)
                }
                .environmentObject(viewRouter)
            }
        }
        .environmentObject(viewRouter)
        .foregroundColor(Color("MyWhiteColor"))
        .font(Font.custom("Rawer-CondensedThin", size: 22))
        .tabViewStyle(.page(indexDisplayMode: .automatic))
    }
}

struct welcomescreen_Previews: PreviewProvider
{
    static var previews: some View
    {
        welcomescreen()
            .environmentObject(ViewRouter())
    }
}

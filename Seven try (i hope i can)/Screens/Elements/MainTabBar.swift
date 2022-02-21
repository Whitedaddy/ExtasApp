//
//  MainTabBar.swift
//  Extas
//
//  Created by MacBook on 21.12.2021.
//

var TabBarItems = ["Crown","Gear"]

import SwiftUI

struct MainTabBar: View {
    
    @EnvironmentObject var viewRouter: ViewRouter
    let colors = Gradient(colors: [.white, .black])
    @State var CrownOpacity: Double = 1
    @State var GearOpacity: Double = 1
    
    var body: some View {
        
        //let gradient = RadialGradient(gradient: colors, center: .center, startRadius: 0, endRadius: 60)
        
        ZStack
        {
            HStack(spacing: Get_Width(w: 0.35))
            {
                ForEach(TabBarItems,id: \.self)
                {
                    item in
                    
                    Button(action:{
                        if (viewRouter.SelectedTab != item)
                        {viewRouter.SelectedTab = item}})
                    {
                        if(item == viewRouter.SelectedTab)
                        {
                            Image(item)
                                .resizable()
                                .padding(8)
                                .frame(width: Get_Height(h: 0.15), height: Get_Height(h: 0.15))
                        }
                        else
                        {
                            Image(item)
                                .resizable()
                                .padding(8)
                                .frame(width: Get_Height(h: 0.15), height: Get_Height(h: 0.15))
                                .opacity(0.5)
                        }
                    }
                }
            }
            .frame(width: Get_Width(w: 0.95), height: Get_Height(h: 0.1))
            .background(Color.black)
            .cornerRadius(35)
            
            Button(action: {
                if (viewRouter.SelectedTab != "Link")
                {viewRouter.SelectedTab = "Link"} } )
            {
                if (viewRouter.SelectedTab == "Link")
                {
                Image("Link")
                    .resizable()
                    .padding(8)
                    .frame(width: Get_Height(h: 0.12), height: Get_Height(h: 0.12))
                    .shadow(color: .white.opacity(0.5), radius: 10, x: 0, y: 0)
                }
                else
                {
                    Image("Link")
                        .resizable()
                        .padding(8)
                        .frame(width: Get_Height(h: 0.12), height: Get_Height(h: 0.12))
                }
                
            }
            .offset(y:-10)
        }
        
    }
}

func MainTabBar_Opacity (item: String, VRST: String) -> Double
{
    if(item != VRST) {return 0}
    else {return -0.3}
    
}



struct MainTabBar_Previews: PreviewProvider {
    static var previews: some View {
        MainTabBar()
            .environmentObject(ViewRouter())
    }
}

//
//  MotherView.swift
//  Seven try (i hope i can)
//
//  Created by Матвей Марюха on 21.10.2021.
//

import SwiftUI



struct MotherView: View
{
    
    @EnvironmentObject var viewRouter: ViewRouter
    @EnvironmentObject var platformID: PlatformID
    
    var body: some View
    {
        ZStack
        {
            BackgroundView()
            
            
            switch viewRouter.currentPage
            {
            case .page1:
                welcomescreen ()
                    .transition(.move (edge: .trailing))
            case .page2:
                ChoosePlatformView ()
            case .page3:
                MainBoard ()
                    .environmentObject(ViewRouter())
                    .environmentObject(PlatformID())
            case .page4:
                Terms_and_Policy ()
                    .environmentObject(ViewRouter())
                
            }
        }
        
    }
}



struct MotherView_Previews: PreviewProvider
{
    static var previews: some View
    {
        MotherView()
            .environmentObject(ViewRouter())
            .environmentObject(PlatformID())

    }
}

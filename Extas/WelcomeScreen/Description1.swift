//
//  Description1.swift
//  Seven try (i hope i can)
//
//  Created by Матвей Марюха on 22.10.2021.
//

import SwiftUI

struct Description1: View
{
    
    @EnvironmentObject var viewRouter: ViewRouter
    
    var body: some View
    {
        VStack
        {
            VStack
            {
                Text("ТЕПЕРЬ")
                
                Text("ПОРА РАССКАЗАТЬ ТЕБЕ")
                
                Text("КАК МЫ РАБОТАЕМ")
            }
            .padding()
           // .font(Font.custom("CocogoosePro-Thin", size: 20))
            .multilineTextAlignment(.center)
            
            Rectangle()
                .fill(Color.gray)
                .padding()
                .frame(minWidth: 100, idealWidth: 280, maxWidth: 350, minHeight: 100, idealHeight: 250, maxHeight: 400)
        }
    }
}
struct Description1_Previews: PreviewProvider
{
    static var previews: some View
    {
        Description1()
            .environmentObject(ViewRouter())
            .environmentObject(PlatformID())
    }
}


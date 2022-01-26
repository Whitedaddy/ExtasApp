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
                    .padding(.top, Get_Height(h: 0.012))
                
                Text("ПОРА РАССКАЗАТЬ ТЕБЕ")
                
                Text("КАК МЫ РАБОТАЕМ")
            }
            .padding()
            .multilineTextAlignment(.center)
            
                VideoPlayerView()
                    .frame(width: Get_Width(w: 0.8), height: Get_Height(h: 0.65))
            Spacer()
        }
    }
}
struct Description1_Previews: PreviewProvider
{
    static var previews: some View
    {
        Description1()
    }
}


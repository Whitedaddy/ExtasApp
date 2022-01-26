//
//  ContentView.swift
//  Seven try (i hope i can)
//
//  Created by Матвей Марюха on 20.10.2021.
//

import SwiftUI

struct ContentView: View
{
    
    var body: some View
    {
                
        VStack (alignment: .center, spacing: 50 )
        {
            VStack
            {
                Spacer()
                
                Text("ПРИВЕТ")
                    .padding()
                    .font(Font.custom("Rawer-CondensedThin", size: 30))
              //      .font(Font.custom("CocogoosePro-Thin", size: 30))
                    .multilineTextAlignment(.center)
                
            Text("НАШ ДОРОГОЙ ПОЛЬЗОВАТЕЛЬ")
                .padding()
              //  .font(Font.custom("CocogoosePro-Thin", size: 20))
                .multilineTextAlignment(.center)
                
            Text("Рады тебя видеть!")
                .padding()
               // .font(Font.custom("Rawer-CondensedThin", size: 20))
             //   .font(Font.custom("CocogoosePro-Thin", size: 20))
                .multilineTextAlignment(.center)
               
            
                Spacer()

            }

            
        }
}
}

struct ContentView_Previews: PreviewProvider
{
    static var previews: some View
    {
        ContentView()
    }
}

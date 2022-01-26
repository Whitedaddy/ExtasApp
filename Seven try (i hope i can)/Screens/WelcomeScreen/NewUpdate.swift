//
//  NewUpdate.swift
//  Seven try (i hope i can)
//
//  Created by Матвей Марюха on 23.10.2021.
//

import SwiftUI

struct NewUpdate: View
{
    var body: some View
    {
        VStack
        {
            VStack
            {
                Text("ДРУЖИЩЕ!")
                    .padding(1)
                    .font(Font.custom("Rawer-CondensedThin", size: 25))
                   // .font(Font.custom("CocogoosePro-Thin", size: 25))
                
                Text("МЫ СОБИРАЕМСЯ ВЫПУСКАТЬ ОБНОВЛЕНИЕ")
                    .padding(1)
                  //  .font(Font.custom("CocogoosePro-Thin", size: 20))
                
                Text("ТАМ БУДЕТ НЕЧТО, ЧТО СНЕСЕТ ТЕБЕ КРЫШУ")
                    .padding(1)
                  //  .font(Font.custom("CocogoosePro-Thin", size: 20))
            }
            .multilineTextAlignment(.center)
            
            ZStack {
                Rectangle()
                    .fill(Color.gray)
                    .padding()
                Text("Здесь будет видео")
            }   
        }
        
    }
}

struct NewUpdate_Previews: PreviewProvider
{
    static var previews: some View
    {
        NewUpdate()
    }
}

//
//  ExplainingVideoRepeat.swift
//  ExtasApp
//
//  Created by MacBook on 19.01.2022.
//

import SwiftUI

struct ExplainingVideoRepeat: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        
        ZStack {
            
            BackgroundView()
            
            VStack
            {
                HStack
                {
                    Text("Как мы работаем")
                        .padding(.leading, 50)
                        .font(Font.custom("Rawer-CondensedThin", size: 25))

                    Spacer()

                    Button (action: {presentationMode.wrappedValue.dismiss()})
                    {
                        Image(systemName: "xmark")
                            .resizable()
                            .font(.callout)
                            .frame(width: Get_Height(h: 0.03), height: Get_Height(h: 0.03))
                            .padding(.trailing, 40)
                    }
                }
                .frame(width: Get_Width(w: 1), height: Get_Height(h: 0.07))
                .padding(.vertical, 10)
                .padding(.top,15)
                .background(Color.black)
                .cornerRadius(10)
                
                VideoPlayerView()
                    .frame(width: Get_Width(w: 0.7), height: Get_Height(h: 0.8))
                
                
            }
            .font(Font.custom("Rawer-CondensedThin", size: 20))
            .foregroundColor(Color.white)
        }
    }
}

struct ExplainingVideoRepeat_Previews: PreviewProvider {
    static var previews: some View {
        ExplainingVideoRepeat()
    }
}

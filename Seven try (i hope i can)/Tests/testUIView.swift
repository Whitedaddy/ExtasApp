//
//  testUIView.swift
//  Seven try (i hope i can)
//
//  Created by Матвей Марюха on 31.10.2021.
//

import SwiftUI

struct testUIView: View
{
    
    var body: some View
    {
        ZStack
        {
            Image("MyAvatar")
                .resizable()
                .clipShape(Circle())
                .shadow(radius: 15)
                .overlay(Circle().stroke(Color.purple, lineWidth: 1))
                .frame(width: Get_Height(h: 0.1), height: Get_Height(h: 0.1))
        }
    }
}



struct testUIView_Previews: PreviewProvider
{
    static var previews: some View
    {
        testUIView()
    }
}

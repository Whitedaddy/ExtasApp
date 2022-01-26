//
//  SwiftUIView.swift
//  ExtasApp
//
//  Created by MacBook on 17.01.2022.
//

import SwiftUI

struct LinkContent: View
{
    let fd: track
    
    var body: some View
    {
        
            VStack
            {
                
                HStack
                {
                    Text(fd.authors[0])
                        .foregroundColor(.purple)
                    Text(fd.name)
                    .font(Font.custom("Rawer-CondensedThin", size: Get_Height(h: 0.03)))
                }
                .padding(.horizontal, 30)
                .padding(.top, 10)
                .padding(.bottom, 0)
                
                VStack
                {
                    //Spacer()
                    HStack
                    {
                        Spacer()
                        Text("Искали: \(fd.searched_times) раз")
                            .foregroundColor(.gray)
                        .font(Font.custom("Rawer-CondensedThin", size: Get_Height(h: 0.025)))
                    }
                    .padding(.bottom, 10)
                }
                .padding(.trailing, 30)
            }
            .frame(width: Get_Width(w: 0.8), height: Get_Height(h: 0.08))
            .background(Color.black.opacity(0.9))
            .cornerRadius(45)
            .shadow(color:Color.purple,radius: 10, x: 5, y: 10)
            .padding(.bottom, 10)
        }
}


//
//  TopArtisits.swift
//  Seven try (i hope i can)
//
//  Created by MacBook on 17.12.2021.
//

import SwiftUI

struct TopArtisits: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        
        ZStack
        {
            Image("backgroundReady")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
            VStack
        {
            HStack
            {
                Text("ТОП Артистов")
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
                
            ScrollView
            {
                LazyVStack
                {
                    ForEach(1..<16)
                    {
                        i in
                        Link(destination: URL(string: "https://www.instagram.com/poka___secret/")!)
                        {
                            HStack
                            {
                                Image(systemName: "\(i).circle.fill")
                                Text("Artist Name # \(i)")

                            }
                            .frame(width: Get_Width(w: 0.8), height: Get_Height(h: 0.07))
                            .background(Color.black.opacity(0.9))
                            .cornerRadius(45)
                            .shadow(color:Color.purple,radius: 10, x: 0, y: 0)
                        }
                    }
                }
                .padding(.top,10)
            }
        }
        .font(Font.custom("Rawer-CondensedThin", size: 20))
        .foregroundColor(Color.white)
        }
    }
}

struct TopArtisits_Previews: PreviewProvider {
    static var previews: some View {
        TopArtisits()
            .environmentObject(ViewRouter())
    }
}

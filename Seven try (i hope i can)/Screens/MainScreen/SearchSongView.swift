//
//  SearchSongView.swift
//  Seven try (i hope i can)
//
//  Created by Матвей Марюха on 03.11.2021.
//

import SwiftUI

struct SearchSongView: View
{
    @EnvironmentObject var platformID: PlatformID
    @ObservedObject var backConnection = SingleSongCombine ()
    
    @State var SongLink = ""
    @State var NewURL = "None"
    @State var serv1 = userDefaults!.string(forKey: "Service")
    
    var body: some View
    {
            VStack
            {
                Spacer(minLength: Get_Height(h: 0.07))
                
                VStack//Text and arrow
                {
                    Text ("Ссылочку попрошу сюда")
                        .multilineTextAlignment(.center)
                        .font(Font.custom("Rawer-CondensedThin", size: 30))
                        .frame(width: Get_Width(w: 0.95), height: Get_Height(h: 0.08))
                    
                    Image("Arrow")
                        .resizable()
                        .frame(width: Get_Width(w: 0.15), height: Get_Height(h: 0.03))
                        .background(Color.black.opacity(0.1))
                        .padding(.bottom, 15)
                }
                
                
                VStack //TexField for link
                {
                    TextField ("", text: $backConnection.OldSongUrl)
                        .placeholder(when: backConnection.OldSongUrl.isEmpty) {
                            Text("URL")
                                .foregroundColor(Color("MyWhiteColor"))
                                .padding(.leading,20)
                        }
                        .foregroundColor(Color.white)
                        .padding(.horizontal, 20)
                    //.frame(width: Get_Width(w: 0.85), height: Get_Height(h: 0.09))
                        .background(RoundedRectangle(cornerRadius: 50)
                                        .fill(Color.black)
                                        .frame(width: Get_Width(w: 0.85), height: Get_Height(h: 0.09))
                                        .shadow(color:Color.purple,radius: 10, x: 5, y: 10)
                        )
                }
                .padding(20)
                
                GeometryReader
                {geometry in
                    ZStack //Button to get new link
                    {
                        Button (action:{   if(backConnection.OldSongUrl != "")
                            {backConnection.MainExchangeButtonOn = true}
                            DispatchQueue.global(qos: .userInitiated).async
                            {backConnection.GetSingleSong(songURL: backConnection.OldSongUrl, Service: serv1!)}
                            UIApplication.shared.endEditing()
                        })
                        {
                            Image("Transfer")
                                .resizable()
                                .frame(width: Get_Height(h: 0.1), height: Get_Height(h: 0.1))
                                .shadow(color:Color("MyWhiteColor"),radius: 10, x: 0, y: 0)
                        }
                        .padding(.vertical, geometry.size.height/2)
                        .frame(width: geometry.size.width, height: geometry.size.height)
                        .rotationEffect(Angle(degrees:backConnection.MainExchangeButtonOn ? 0 : -360))
                        .animation(backConnection.MainExchangeButtonOn ?
                                   Animation
                                    .linear(duration: 2.0)
                                   //.repeatForever(autoreverses: false)
                                   :Animation
                                    .linear(duration: 0)
                        )
                        
                    }
                    .onTapGesture {UIApplication.shared.endEditing()}
                }
                
                
                VStack //Arrow
                {
                    Image("Arrow")
                        .resizable()
                        .frame(width: Get_Width(w: 0.15), height: Get_Height(h: 0.03))
                        .background(Color.black.opacity(0.1))
                        .padding(.vertical, 10)
                }
                
                // Hyper link
                
                VStack
                {
                    if backConnection.NewSong.url != "None" && backConnection.NewSong.url != "none"
                    {
                        Link(destination: URL(string: backConnection.NewSong.url)
                             ?? URL(string: "https://www.instagram.com/poka___secret/")!)
                        {
                            Text("ЖМИ!")
                        }
                        .frame(width: Get_Width(w: 0.55), height: Get_Height(h: 0.1))
                        .background(Color.black)
                        .cornerRadius(45)
                        .foregroundColor(.white)
                        .shadow(color:Color("MyWhiteColor"),radius: 10, x: 5, y: 10)
                    }
                    
                    else
                    {
                        Text("Пока ничего")
                            .frame(width: Get_Width(w: 0.55), height: Get_Height(h: 0.1))
                            .background(Color.black)
                            .cornerRadius(45)
                            .foregroundColor(.white)
                            .shadow(color:Color.purple,radius: 10, x: 5, y: 10)
                    }
                }
                
                
                HStack //Platform Chosen
                {
                    Text("Выбрано: \(String(describing:serv1!))")
                }
                .padding(.top, 15)
                
                Spacer(minLength: Get_Height(h: 0.2))
            }
            .ignoresSafeArea(.keyboard, edges: .bottom)
            .onTapGesture {UIApplication.shared.endEditing()}
    }
}

struct SearchSongView_Previews: PreviewProvider
{
    static var previews: some View
    {
        SearchSongView()
            .environmentObject(PlatformID())
    }
}

/*
 https://music.yandex.ru/album/4066489/track/33274678
 */

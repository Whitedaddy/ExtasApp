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
    @ObservedObject var api = Api()
    @State var SongLink = ""
    @State var TestSongLink = ""
    @State var CuttedSongLink = ""
  //  @State var loadedData: [LoadedData]
    @State var serv1 = UserDefaults.standard.string(forKey: "Service")
    let colors = Gradient(colors: [Color("MyWhiteColor"), Color("MyPurpleColor")])

    var body: some View
    {
//        let gradient = RadialGradient(gradient: colors, center: .center, startRadius: 0, endRadius: 30)
        
        VStack
        {
            VStack//Text and arrow
            {
                Text ("Ссылочку попрошу сюда")
                    .padding()
                .multilineTextAlignment(.center)
                .font(Font.custom("Rawer-CondensedThin", size: 30))
            
            Image("Arrow")
                .resizable()
                .frame(width: 50, height: 25)
                .padding()
                .background(Color.black.opacity(0.1))
            }
            
            VStack //TexField for link
            {
                TextField ("Link", text: $SongLink)
                    .padding()
                    .foregroundColor(Color("MyBlackColor"))
                    .background(Color("MyWhiteColor").opacity(0.95))
                    .shadow(color:Color("MyWhiteColor"),radius: 10, x: 0, y: 0)
                    .frame(width: 300, height: 80)
                .cornerRadius(100)
            }
            
            ZStack //Button to get new link
            {
                Button (action:
                            {
                    api.Song_URL = SongLink;
                    serv1 = UserDefaults.standard.string(forKey: "Service")
                    api.ServiceNAME = serv1!
                    api.getSongs();
                })
                        {
                            ZStack
                            {
//                                Circle()
//                                    .fill(gradient)
//                                    .frame(width: 60, height: 60)
//                                    .opacity(0.2)
//                                    .overlay(RoundedRectangle(cornerRadius: 200)
//                                                .stroke(Color("MyWhiteColor").opacity(0.4),lineWidth: 3)
//                                                .opacity(0.8))
//                                
//                                
//                                Image(systemName: "arrow.triangle.2.circlepath")
//                                    .resizable()
//                                    .foregroundColor(Color("MyWhiteColor").opacity(0.7))
//                                    .shadow(color:Color("MyWhiteColor"),radius: 20, x: 0, y: 0)
//                                    .frame(width: 50, height: 50)
                                
                                Image("Transfer")
                                    .resizable()
                                    .frame(width: 150, height: 150)
                                    .padding(-35)
                                    .opacity(0.7)
                            }
                        }
                        .frame(width: 150, height: 150)
                        .padding(-35)
                    .cornerRadius(100)
            }
            
            VStack //Arrow
            {
                Image("Arrow")
                    .resizable()
                    .frame(width: 50, height: 25)
                    .padding()
                .background(Color.black.opacity(0.1))
            }

            // Hyper link
            if api.get != "none"
            {

                Link(destination: URL(string: api.get)!)
                {
                    Text("ЖМИ!")
                }
                    .padding()
                    .frame(width: 300, height: 60)
                    .foregroundColor(Color("MyBlackColor"))
                    .background(Color("MyWhiteColor").opacity(0.95))
                    .shadow(color:Color("MyWhiteColor"),radius: 10, x: 0, y: 0)
                    .cornerRadius(50)
            }
            else
            {
                Text("Пока ничего не вижу")
                    .padding()
                    .foregroundColor(.black)
                    .frame(width: 300, height: 60)
                    .background(Color.white.opacity(0.8))
                    .cornerRadius(50)
            }
            
            HStack //Platform Chosen
            {
                Text("Chosen: \(String(describing:serv1!))")
            }
            
            Spacer()
            
        }
    }
}

struct SearchSongView_Previews: PreviewProvider
{
    static var previews: some View
    {
        SearchSongView()
            .environmentObject(Api())
            .environmentObject(PlatformID())
    }
}
//Text("Link: \(api.get)")
/*
https://music.yandex.ru/album/4066489/track/33274678
*/

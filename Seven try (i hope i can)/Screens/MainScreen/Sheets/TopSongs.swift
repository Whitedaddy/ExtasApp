//
//  TopSongs.swift
//  Seven try (i hope i can)
//
//  Created by MacBook on 17.12.2021.
//

import SwiftUI

struct TopSongs: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    @ObservedObject var backConnection = BackConnection ()
    
    var limit: Int = 25
    
    @State var serv1 = userDefaults!.string(forKey: "Service")
    @State var SongLink: URL = URL(string: "https://www.instagram.com/poka___secret/")!
    
    
    var body: some View {
        
        ZStack {
            
            BackgroundView()
            
            VStack
            {
                HStack
                {
                    Text("ТОП Треков")
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
                        if(backConnection.IsTopDownloaded == false)
                        {
                            ForEach(0..<limit)
                            {  fd in
                                Link(destination: URL(string: "https://www.instagram.com/poka___secret/")!)
                                {
                                    HStack
                                    {
                                        Image(systemName: "\(fd).circle.fill")
                                        
                                        VStack
                                        {
                                            Text("SongName # \(fd)")
                                            Text("Artist Name # \(fd)")
                                                .foregroundColor(.gray)
                                                .font(.caption)
                                        }
                                        //.onAppear(perform: {num+=1})
                                    }
                                }
                                .frame(width: Get_Width(w: 0.8), height: Get_Height(h: 0.07))
                                .background(Color.black.opacity(0.9))
                                .cornerRadius(45)
                                .shadow(color:Color.purple,radius: 10, x: 0, y: 0)
                                .padding(.bottom, 3)
                            }
                        }
                        else
                        {
                            ForEach (backConnection.tracksss)
                            {fd in
                                switch serv1
                                    {
                                case "AppleMusic":
                                    Link(destination: URL(string: fd.apple_url) ?? SongLink  )
                                    { LinkContent (fd: fd) }
                                case "YandexMusic":
                                    Link(destination: URL(string: fd.yandex_url) ?? SongLink  )
                                    { LinkContent (fd: fd) }
                                case "Spotify":
                                    Link(destination: URL(string: fd.spotify_url) ?? SongLink )
                                    { LinkContent (fd: fd) }
                                case "YouTube":
                                    Link(destination: URL(string: fd.youtube_url) ?? SongLink )
                                    { LinkContent (fd: fd) }
                                default:
                                    Link(destination: SongLink)
                                    { LinkContent (fd: fd) }
                                    }
                                
                            }
                        }
                    }
                    .padding(.top, 10)
                }
                .onAppear(perform: {backConnection.GetTop(PlaceLimit: limit)} )
            }
            .font(Font.custom("Rawer-CondensedThin", size: 20))
            .foregroundColor(Color.white)
        }
    }
}

struct TopSongs_Previews: PreviewProvider {
    static var previews: some View {
        TopSongs()
            .environmentObject(ViewRouter())
    }
}

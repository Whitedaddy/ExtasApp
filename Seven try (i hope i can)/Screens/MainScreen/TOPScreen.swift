//
//  TOPScreen.swift
//  Seven try (i hope i can)
//
//  Created by MacBook on 16.12.2021.
//

import SwiftUI





struct TOPScreen: View
{
    
    @EnvironmentObject var viewRouter: ViewRouter
    @StateObject var backConnection = TopCombine ()
    
    @State var Songs:Bool = false
    @State var Artists:Bool = false
    
    @State var top: [track] = []
    
    @State var serv1 = userDefaults!.string(forKey: "Service")
    
    var limit: Int = 5
    
    @State var SongLink: URL = URL(string: "https://www.instagram.com/poka___secret/")!
    
    
    
    
    var body: some View
    {
        
        VStack
        {
            
            Text("Самые популярные композиции")
                .frame(width: Get_Width(w: 0.9), height: Get_Height(h: 0.05))
                .padding(.top, Get_Height(h: 0.015))
                
            
            HStack
            {
                Text("Cлушай на своей платформе!")
                Image(systemName: "arrowshape.turn.up.right.fill")
                    .rotationEffect(Angle(degrees: 90))
            }
            .foregroundColor(Color("MyWhiteColor"))
            .font(Font.custom("Rawer-CondensedThin", size: Get_Height(h: 0.025)))
            
            VStack
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
                        .frame(width: Get_Width(w: 0.8), height: Get_Height(h: 0.08))
                        .background(Color.black.opacity(0.9))
                        .cornerRadius(45)
                        .shadow(color:Color.purple,radius: 10, x: 5, y: 5)
                        .padding(.bottom, 10)
                    }
                }
                
                else
                {
                    ForEach (backConnection.Tracksss)
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
                
                Button(action: {
                    Songs.toggle()
                },label:{Text("Смотреть всех")
                        .frame(width: Get_Width(w: 0.5), height: Get_Height(h: 0.07))
                        .background(Color.black.opacity(0.9))
                        .cornerRadius(45)
                        .shadow(color: Color("MyWhiteColor").opacity(0.6), radius: 10, x: 0, y: 0)
                        .padding(Get_Height(h: 0.02))
                })
                    .sheet(isPresented: $Songs, content: {TopSongs()})
                
            }
            .onAppear(perform: {backConnection.GetTop(PlaceLimit: limit)} )
            
            Spacer()
            
        }
    }
}


struct TOPScreen_Previews: PreviewProvider {
    static var previews: some View {
        TOPScreen()
            .environmentObject(ViewRouter())
    }
}


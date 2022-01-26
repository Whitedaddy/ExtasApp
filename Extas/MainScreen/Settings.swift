//
//  Settings.swift
//  Seven try (i hope i can)
//
//  Created by Матвей Марюха on 27.10.2021.
//

import SwiftUI


var ConfirmedServices = ["YandexMusic","Spotify","YouTube"]


struct Settings: View
{
    @EnvironmentObject var viewRouter: ViewRouter
    
    @EnvironmentObject var platformID: PlatformID
    
    @EnvironmentObject var API: Api
    
    @State var serv1 = UserDefaults.standard.string(forKey: "Service")
    //UserDefaults.standard.string(forKey: "Service")
    @State var faq = 0
    

    var body: some View
    {
        ZStack
        {
            
             VStack
            {
                Spacer(minLength: 100)
                
                //Text Describing Question
                VStack
                {
                    Text("Каким стриминговым сервисом пользуешься?")
                    .padding()
                    .frame(width: 380, height: 90)
                    .multilineTextAlignment(.center)
                    //.shadow(radius: 3)
                }
                
                //Buttons for every platform
                VStack
                {
                    ForEach(ConfirmedServices,id: \.self)
                    {  nameservice in
                        Button(action:{
                            serv1 = nameservice
                            UserDefaults.standard.set(self.serv1, forKey: "Service")},
                               label:{
                            Text(nameservice)
                                .frame(width: 280, height: 50)
                                .background(GetOpacity(nameservice: nameservice))
                                .cornerRadius(45)
                                .foregroundColor(.white)
                                .shadow(color:
                                            GetColor(nameservice: nameservice),
                                        radius: 10, x: 0, y: 0)
                                })
                    }
                }
                
               // Text Which Platform is chosen right now
                VStack
                {
                    Text("Chosen: \(String(describing:serv1))")
                        .padding(-10)
                        .offset(y:-1000)
                }
                
                //Inst & FAQ
                HStack
                {
                    Link(destination: URL(string: "https://www.instagram.com/poka___secret/")!)
                    {
                        Image("instagram")
                            .resizable()
                            .frame(width: 50, height: 50)
                            .background(Color("MyWhiteColor").opacity(0.2))
                            .cornerRadius(15)
                            .padding()
                    }
                    Button(action: {
                        viewRouter.currentPage = .page4
                    })
                    {
                        Image("faq")
                            .resizable()
                            .frame(width: 50, height: 50)
                            .background(Color("MyWhiteColor").opacity(0.2))
                            .cornerRadius(25)
                            .padding()
                    }
                }

            // Button Reset App
//                HStack
//                {
//                    Button (action:{
//                        serv1 = "None"
//                        UserDefaults.standard.set(self.serv1, forKey: "Service")})
//                    {
//                        Text ("Reset App")
//                            .frame(width: 100, height: 50)
//                            .background(Color("MyWhiteColor"))
//                            .cornerRadius(45)
//                            .foregroundColor(.white)
//                            .shadow(color: Color("MyPurpleColor"), radius: 10, x: 0, y: 0)
//                    }
//                    
//                }
                
                Spacer()
                
            }
            .onAppear
            {
             guard   let serv2 = UserDefaults.standard.value(forKey: "Service")
                else { return }
                self.serv1 = serv2 as? String
            }
            
        }
        
        
        
    }
}

//Color for shadow
func GetColor (nameservice:String?) -> Color
{
    if nameservice == UserDefaults.standard.value(forKey: "Service") as? String
    {return Color("MyWhiteColor")}
    else
    {return Color("MyPurpleColor")}
    
}

//Rewrite opacity
func GetOpacity (nameservice:String?) -> Color
{
    if nameservice == UserDefaults.standard.value(forKey: "Service") as? String
    {return Color.black.opacity(0.9)}
    else
    {return Color.black}
}

struct Settings_Previews: PreviewProvider {
    static var previews: some View {
        Settings()
            .environmentObject(PlatformID())
            .environmentObject(Api())
    }
}

//VStack
//{
//    //Yandex
//    HStack
//    {
//        ZStack
//        {
//
//            Button(action:
//                    {serv1 = "YandexMusic"
//                UserDefaults.standard.set(self.serv1, forKey: "Service")})
//            {
//                Text("YandexMusic")
//                    .frame(width: 280, height: 50)
//                    .background(Color.black)
//                    .cornerRadius(45)
//                    .foregroundColor(.white)
//                    .shadow(color: Color("MyPurpleColor"), radius: 10, x: 0, y: 0)
//            }
//
//        }
//    }
//
//    //Spotify
//    HStack
//    {
//        ZStack
//        {
//
//            Button(action:
//                    {serv1 = "Spotify"
//                UserDefaults.standard.set(self.serv1, forKey: "Service")})
//            {
//                Text("Spotify")
//                    .frame(width: 280, height: 50)
//                    .background(Color.black)
//                    .cornerRadius(45)
//                    .foregroundColor(.white)
//                    .shadow(color: Color("MyPurpleColor"), radius: 10, x: 0, y: 0)
//            }
//        }
//    }
//
//    //Apple Music
//    HStack
//    {
//        ZStack
//        {
//
//            Button(action:
//                    {serv1 = "ITunes"
//                UserDefaults.standard.set(self.serv1, forKey: "Service")})
//            {
//                Text("Apple music")
//                    .frame(width: 280, height: 50)
//                    .background(Color.black)
//                    .cornerRadius(45)
//                    .foregroundColor(.white)
//                    .shadow(color: Color("MyPurpleColor"), radius: 10, x: 0, y: 0)
//            }
//            }
//        }
//
//    //Boom
//    HStack
//    {
//        ZStack
//        {
//
//        Button(action:
//                {serv1 = "Boom"
//            UserDefaults.standard.set(self.serv1, forKey: "Service")})
//        {
//            Text("Boom")
//                .frame(width: 280, height: 50)
//                .background(Color.black)
//                .cornerRadius(45)
//                .foregroundColor(.white)
//                .shadow(color: Color("MyPurpleColor"), radius: 10, x: 0, y: 0)
//        }
//        }
//        }
//
//    //YouTube
//    HStack
//    {
//        ZStack
//        {
//
//            Button(action:
//                    {serv1 = "YouTube"
//                UserDefaults.standard.set(self.serv1, forKey: "Service")})
//            {
//                Text("YT Music")
//                    .frame(width: 280, height: 50)
//                    .background(Color.black)
//                    .cornerRadius(45)
//                    .foregroundColor(.white)
//                    .shadow(color: Color("MyPurpleColor"), radius: 10, x: 0, y: 0)
//            }
//        }
//    }
//
//    //Reset App
//    HStack
//    {
//        ZStack
//        {
//
//            Button(action:
//                    {serv1 = "None"
//                UserDefaults.standard.set(self.serv1, forKey: "Service")})
//            {
//                Text("Reset App")
//                    .frame(width: 280, height: 50)
//                    .background(Color.black)
//                    .cornerRadius(45)
//                    .foregroundColor(.white)
//                    .shadow(color: Color("MyPurpleColor"), radius: 10, x: 0, y: 0)
//            }
//        }
//    }
//}
//.padding()
//.frame(width: 250, height: 380)

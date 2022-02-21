//
//  Settings.swift
//  Seven try (i hope i can)
//
//  Created by Матвей Марюха on 27.10.2021.
//

import SwiftUI



struct Settings: View
{
    @EnvironmentObject var viewRouter: ViewRouter
    
    @EnvironmentObject var platformID: PlatformID
    
    @State var serv1 = UserDefaults.standard.string(forKey: "Service")
    //UserDefaults.standard.string(forKey: "Service")
    @State var faq:Bool = false
    @State var how:Bool = false
    
    let userDefaults = UserDefaults(suiteName: "group.mot.Seven-try--i-hope-i-can-")
    

    var body: some View
    {
        ZStack
        {
             VStack
            {
                
                //Text Describing Question
                VStack
                {
                    Text("Каким стриминговым сервисом пользуешься?")
                    .padding(20)
                    .multilineTextAlignment(.center)
                    //.shadow(radius: 3)
                }
                
                //Buttons for every platform
                ForEach(ConfirmedServices,id: \.self)
                {  nameservice in
                    Button(action:{
                        serv1 = nameservice
                        userDefaults!.set(self.serv1 as String?, forKey: "Service")},
                           label:{
                        Text(nameservice)
                            .frame(width: Get_Width(w: 0.8), height: Get_Height(h: 0.08))
                            .background(Settings_GetOpacity(nameservice: nameservice))
                            .cornerRadius(45)
                            .foregroundColor(.white)
                            .shadow(color:
                                        Settings_GetColor(nameservice: nameservice),
                                    radius: 10, x: 5, y: 10)
                            .padding(.bottom, 3)
                    })
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
                            .background(Color("MyWhiteColor").opacity(0.2))
                            .cornerRadius(25)
                            .frame(width: Get_Height(h: 0.1), height: Get_Height(h: 0.1))
                            .padding(.horizontal, 20)
                    }
                    
                    Button(action: {
                        faq.toggle()
                    })
                    {
                        Image("faq")
                            .resizable()
                            .background(Color("MyWhiteColor").opacity(0.2))
                            .cornerRadius(45)
                            .frame(width: Get_Height(h: 0.1), height: Get_Height(h: 0.1))
                            .padding(.horizontal, 20)
                    }
                    .sheet(isPresented: $faq, content: {Terms_and_Policy()})
                }
                .padding(.top, 15)
                
                Button(action: {
                    how.toggle()
                })
                {
                    Text("Как пользоваться")
                        .foregroundColor(Color("MyWhiteColor"))
                        .frame(width: Get_Height(h: 0.3), height: Get_Height(h: 0.1))
                        .background(Color.black)
                        .cornerRadius(45)
                        .shadow(color: Color.white,
                                radius: 10, x: 5, y: 10)
                        .padding(.top, Get_Height(h: 0.03))
                }
                .sheet(isPresented: $how, content: {ExplainingVideoRepeat()})
                
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
func Settings_GetColor (nameservice:String?) -> Color
{
    if nameservice == userDefaults!.string(forKey: "Service")
    {return Color("MyWhiteColor")}
    else
    {return Color.purple}
    
}

//Rewrite opacity
func Settings_GetOpacity (nameservice:String?) -> Color
{
    if nameservice == userDefaults!.string(forKey: "Service")
    {return Color.black.opacity(0.9)}
    else
    {return Color.black}
}


struct Settings_Previews: PreviewProvider {
    static var previews: some View {
        Settings()
            .environmentObject(PlatformID())
    }
}

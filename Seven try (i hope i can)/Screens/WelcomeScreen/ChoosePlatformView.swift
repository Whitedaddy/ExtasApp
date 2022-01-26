//
//  ChoosePlatformView.swift
//  Seven try (i hope i can)
//
//  Created by Матвей Марюха on 21.10.2021.
//

import SwiftUI

struct ChoosePlatformView: View
{
    
    @EnvironmentObject var viewRouter: ViewRouter
    
    @EnvironmentObject var platformID: PlatformID
    
    @State var serv1 = UserDefaults.standard.string(forKey: "Service")
    
    
    //Яндекс = 0
    //Ютуб = 1
    //Спотифай = 2
    //Бум = 3
    //ЭплМузыка = 4
    
    var body: some View
    {
        VStack
        {
            Spacer()
            
            //Entry Text
            VStack
            {
                Text("Каким стриминговым сервисом пользуешься?")
                .foregroundColor(Color("MyWhiteColor"))
                .padding()
                .frame(width: 380, height: 90)
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
            
//            VStack
//            {
//                Text("Chosen: \(String(describing:serv1))")
//            }
//            .offset(y: -1000)
            
            Spacer()
            
            //NEXT Button
            if serv1 != Optional("None") && serv1 != nil
            {
                Button(action:
                        {viewRouter.currentPage = .page3})
                {
                    HStack
                    {
                        Text("Поехали!")
                        Image(systemName: "chevron.right")
                    }
                    .foregroundColor(Color("MyWhiteColor"))
                    .frame(width: 180, height: 60)
                    .font(Font.custom("Rawer-CondensedThin", size: 40))
                    .shadow(color: Color("MyWhiteColor"), radius: 10, x: 0, y: 0)
                }
                
            }
            
            //to stop little offset
            else
            {
                Text("")
                    .frame(width: 180, height: 60)
            }
            Spacer()
            
        }
        .font(Font.custom("Rawer-CondensedThin", size: 25))
        .foregroundColor(Color("MyWhiteColor"))
        .onAppear
        {
            guard   let serv2 = UserDefaults.standard.value(forKey: "Service")
            else { return }
            self.serv1 = serv2 as? String
        }
    }
}


struct ChoosePlatformView_Previews: PreviewProvider
{
    static var previews: some View
    {
        ChoosePlatformView()
            .environmentObject(ViewRouter())
            .environmentObject(PlatformID())
    }
}

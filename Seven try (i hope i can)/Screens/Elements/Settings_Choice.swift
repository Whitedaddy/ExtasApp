//
//  SwiftUIView.swift
//  Seven try (i hope i can)
//
//  Created by MacBook on 23.12.2021.
//

import SwiftUI

struct Settings_Choice: View
{
    @EnvironmentObject var platformID: PlatformID
    @State var serv1 = UserDefaults.standard.string(forKey: "Service")
    
    var body: some View
    {
        ZStack {
            
            VStack
            {
                //Buttons for every platform
                
                ForEach(ConfirmedServices,id: \.self)
                {  nameservice in
                    Button(action:{
                        serv1 = nameservice
                        UserDefaults.standard.set(self.serv1, forKey: "Service")},
                           label:{
                        Text(nameservice)
                            .frame(width: Get_Width(w: 0.8), height: Get_Height(h: 0.07))
                            .background(Settings_GetOpacity(nameservice: nameservice))
                            .cornerRadius(45)
                            .foregroundColor(.white)
                            .shadow(color:
                                        Settings_GetColor(nameservice: nameservice),
                                    radius: 10, x: 0, y: 0)
                            .padding(.bottom, 3)
                    })
                }
                Spacer()
            }
        }
    }
}

struct Settings_Choice_Previews: PreviewProvider {
    static var previews: some View {
        Settings_Choice()
    }
}

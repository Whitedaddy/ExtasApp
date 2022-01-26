//
//  Terms_and_Policy.swift
//  Seven try (i hope i can)
//
//  Created by MacBook on 01.12.2021.
//

import SwiftUI

struct Terms_and_Policy: View
{
    @Environment(\.presentationMode) var presentationMode
    
    var SongLink: URL = URL(string: "https://www.instagram.com/poka___secret/")!
    
    let information: [Developer] =
    [
        Developer(id: 1, photo: Image("MyAvatar"), name: "Матвей Марюха", profession: "Application Developer", inst: URL(string :"https://www.instagram.com/motyagrr")!, GitHub: URL( string: "https://github.com/Whitedaddy")!),
        Developer(id: 4, photo: Image("MaxAvatar"), name: "Максим Гладков", profession: "Project Manager", inst: URL(string: "https://www.instagram.com/maxim_gladkovv/")!, GitHub: URL( string: "https://github.com/VladislavAlpatov")!),
        Developer(id: 2, photo: Image("VladAvatar"), name: "Владислав Алпатов", profession: "Backend Developer", inst: URL( string: "https://github.com/VladislavAlpatov")!, GitHub: URL( string: "https://github.com/VladislavAlpatov")! ),
        Developer(id: 3, photo: Image("PisunAvatar"), name: "Дмитрий Белоусов", profession: "UI/UX Designer", inst: URL( string: "https://www.instagram.com/whiityque/")!, GitHub: URL( string: "http://beloysoffd.tilda.ws/resumeinrus")! )
    ]
    
    var body: some View
    {
        ZStack
        {
            
            BackgroundView()
            
            VStack
            {
                HStack
                {
                    
                    Text("О нас")
                        .padding(30)
                        .font(Font.custom("Rawer-CondensedThin", size: Get_Height(h: 0.03)))
                    
                    Spacer()
                    
                    Button (action: {presentationMode.wrappedValue.dismiss()})
                    {
                        Image(systemName: "xmark")
                            .resizable()
                            .font(.caption)
                            .frame(width: Get_Height(h: 0.03), height: Get_Height(h: 0.03))
                            .padding(.trailing, 40)
                    }
                }
                .foregroundColor(Color("MyWhiteColor"))
                
                VStack
                {
                    ForEach(information)
                    {
                        person in
                        HStack
                        {
                            CirclePhoto(avatar: person.photo)
                            
                            Spacer()
                            
                            VStack
                            {
                                Text(person.name)
                                    .font(Font.custom("Rawer-CondensedThin", size: Get_Height(h: 0.035)))
                                    .foregroundColor(Color.white)
                                Text(person.profession)
                                    .font(Font.custom("Rawer-CondensedThin", size: Get_Height(h: 0.025)))
                                HStack
                                {
                                    
                                    if (person.id != 2)
                                    {
                                        Link(destination: person.inst)
                                        {
                                            Image("instagram")
                                                .resizable()
                                                .background(Color("MyWhiteColor").opacity(0.2))
                                                .cornerRadius(15)
                                                .frame(width: Get_Height(h: 0.05), height: Get_Height(h: 0.05))
                                        }
                                        .padding(.leading, 40)
                                    }
                                    Spacer()
                                    if(person.id != 4)
                                    {
                                        Link(destination: person.GitHub)
                                        {
                                            Image(systemName: "wrench.fill")
                                                .opacity(0.2)
                                        }
                                        .padding(.trailing, 40)
                                    }
                                    
                                }
                            }
                            
                            Spacer()
                            
                        }
                        .padding()
                        .frame(width: Get_Width(w: 0.9), height: Get_Height(h: 0.15))
                        .background(Color.black)
                        .cornerRadius(100)
                        .shadow(color:Color.purple, radius: 10, x: 0, y: 0)
                        
                        
                    }
                }
                .padding()
                .foregroundColor(Color("MyWhiteColor"))
                
                Spacer()
                
            }
        }
        .font(Font.custom("Rawer-CondensedThin", size: Get_Height(h: 0.03)))
    }
    
}

struct Terms_and_Policy_Previews: PreviewProvider
{
    static var previews: some View
    {
        Terms_and_Policy()
            .environmentObject(ViewRouter())
    }
}

struct Developer: Identifiable
{
    var id: Int
    var photo: Image
    var name: String
    var profession: String
    var inst: URL
    var GitHub: URL
}


struct CirclePhoto: View
{
    
    var avatar: Image
    
    var body: some View
    {
        ZStack
        {
            avatar
                .resizable()
                .clipShape(Circle())
            //.overlay(Circle().stroke(Color.purple.opacity(0.3), lineWidth: 1))
                .frame(width: Get_Height(h: 0.12), height: Get_Height(h: 0.12))
        }
    }
}

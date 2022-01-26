//
//  Terms_and_Policy.swift
//  Seven try (i hope i can)
//
//  Created by MacBook on 01.12.2021.
//

import SwiftUI

struct Terms_and_Policy: View
{
    @EnvironmentObject var viewRouter: ViewRouter
    
    var body: some View
    {
        VStack
        {
            HStack
            {
                Text("Terms & Policy")
                .padding(30)
                .font(.largeTitle)
                .foregroundColor(Color("MyPurpleColor"))
                
                Spacer()
                
                Button (action: {viewRouter.currentPage = .page3})
                {
                    Text("Back")
                }
                .padding(30)
                .foregroundColor(Color("MyPurpleColor"))
            }
                
            ScrollView
            {
                LazyVStack
                {
                    ForEach(ConfirmedServices,id: \.self)
                    {
                        i in
                        Text(i)
                    }
                }
                .foregroundColor(Color("MyWhiteColor"))
            }
        }
        
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

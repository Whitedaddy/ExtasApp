//
//  quick view.swift
//  Seven try (i hope i can)
//
//  Created by Матвей Марюха on 02.11.2021.
//

import SwiftUI

struct quick_view: View
{
    @ObservedObject var backConnection = BackConnection ()
    
//    URL(string: "https://www.apple.com")!
    
    var body: some View
    {
        VStack
        {
            Button(action:
            {} )
            {Text("GetTop")}
           
            
            
        }
    }
}

struct quick_view_Previews: PreviewProvider {
    static var previews: some View {
        quick_view()
    }
}


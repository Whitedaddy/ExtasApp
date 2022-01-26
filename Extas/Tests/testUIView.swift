//
//  testUIView.swift
//  Seven try (i hope i can)
//
//  Created by Матвей Марюха on 31.10.2021.
//

import SwiftUI

struct testUIView: View
{
    @ObservedObject var api = Api()

    var body: some View
    {
        VStack (alignment: .leading)
        {
            Image(systemName: "arrow.triangle.2.circlepath")
                .resizable()
                .foregroundColor(Color("MyWhiteColor"))
            //  .background(Color("MyPurpleColor"))
                .frame(width: 50, height: 50)
            //.padding(-35)
        }
    }
}
struct testUIView_Previews: PreviewProvider
{
    static var previews: some View
    {
        testUIView().environmentObject(Api())
    }
}

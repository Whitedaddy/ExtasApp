//
//  ViewRouter.swift
//  Seven try (i hope i can)
//
//  Created by Матвей Марюха on 21.10.2021.
//

import Foundation


import SwiftUI

class ViewRouter: ObservableObject
{
    @Published var currentPage: Page = .page1
    
    @Published var SelectedTab: String = "Search"
   // @State var serv1 = UserDefaults.standard.value(forKey: "Service") as! String
   // let serv2: String
    @State var serv1: String?
    @State var serv3: String?
        
    init()
    {
        guard  let serv2 = UserDefaults.standard.value(forKey: "Service")
       else {
           return
       }
        

        serv3 = serv2 as? String
            self.serv1 = serv3

        if serv1 == Optional("None") || serv1 == "None"
        {
            currentPage = .page1
        }
        else
        {
            currentPage = .page3
        }
    }
    
}

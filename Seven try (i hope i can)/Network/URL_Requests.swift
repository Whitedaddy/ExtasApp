//
//  URL_Requests.swift
//  Extas
//
//  Created by MacBook on 12.12.2021.
//

import Foundation
import Foundation
import SwiftUI



public class BackConnection: ObservableObject
{
    //Song Variables
    @Published var OldSongUrl: String = ""
    @Published var NewSongUrl: String = "None"
    
    //Song Buttons
    @Published var MainExchangeButtonOn: Bool = false
    
    //TOP Variables
    @Published var tracksss: [track] = []
    
    //Top Buttons
    @Published var IsTopDownloaded: Bool = false
}


                        //Everything, which is connected with decodind you can find in Common/CommonStructs


extension BackConnection // Song
{
    
    func GetNewSong(songURL:String, Service: String)
    {
        let ServerUrl = URL(string: "")
        
        
        guard let requestUrl = ServerUrl
        else { fatalError() }
        var request = URLRequest(url: requestUrl)
        request.httpMethod = "POST"
        request.setValue("Application/json", forHTTPHeaderField: "Content-Type")

         let postString:[String:Any] =
             [
             "song_url": songURL,
             "service": Service
             ]
        
         let jsonData = try? JSONSerialization.data(withJSONObject: postString, options: JSONSerialization.WritingOptions())
         
         request.httpBody = jsonData

         
         URLSession.shared.dataTask(with: request)
         {
             (data, response, error) in

             guard error == nil else
             {
                 print ("Error!!!")
                 DispatchQueue.main.async
                 {
                     self.MainExchangeButtonOn = false
                 }
                 return
             }
             
             guard let data = data else {return}
                do
             {
                 let backData = try JSONDecoder().decode(ParsedSong.self, from: data)
                 DispatchQueue.main.async
                 {
                     self.NewSongUrl = backData.url
                     self.MainExchangeButtonOn = false
                 }
             }
             catch
             {
                 print("Error with decoding")
                 print(self.NewSongUrl)
                 DispatchQueue.main.async
                 {
                     self.MainExchangeButtonOn = false
                 }
             }
         } .resume()
     }
}

extension BackConnection // Top
{
    func GetTop(PlaceLimit: Int)
    {
        let ServerUrl = URL(string: "")
        guard let requestUrl = ServerUrl
        else { fatalError() }
        
        var request = URLRequest(url: requestUrl)
        request.httpMethod = "POST"
        request.setValue("Application/json", forHTTPHeaderField: "Content-Type")
        
        let TopLimit: [String : Int] = ["limit" : PlaceLimit]
        let jsonData = try? JSONSerialization.data(withJSONObject: TopLimit, options: JSONSerialization.WritingOptions())
        request.httpBody = jsonData

        let task = URLSession.shared.dataTask(with: request)
        {(data, response, error) in
            guard let data = data else { return }
//            if let JSONString = String(data: data, encoding: String.Encoding.utf8) {
//               print(JSONString)
//            }
            do
            {
                let parsedTop = try JSONDecoder().decode(ParsedTOP.self, from: data)
                DispatchQueue.main.async
                {
                    print("Sucsess")
                    self.tracksss = parsedTop.tracks
                    self.IsTopDownloaded.toggle()
                    print(self.tracksss)
                    print(data)
                }
            }
            catch
            {
                print("Error with decoding")
            }
        }
        task.resume()
    }

}

extension BackConnection
{
    func openUrl(url: URL?) {
        let selector = sel_registerName("openURL:")
        var responder = self as! UIResponder?
        while let r = responder, !r.responds(to: selector) {
            responder = r.next
        }
        _ = responder?.perform(selector, with: url)
    }
}


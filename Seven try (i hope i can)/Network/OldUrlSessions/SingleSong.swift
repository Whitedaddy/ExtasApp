//
//  SingleSong.swift
//  Extas
//
//  Created by MacBook on 09.02.2022.
//

import Foundation


extension BackConnection // Song
{
    
    func GetNewSong(songURL:String, Service: String)
    {
        guard let requestUrl = URL(string: SingleURL) else { return }
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

//
//  FileUploader.swift
//  Seven try (i hope i can)
//  Created by Матвей Марюха on 28.10.2021.
//    let uploadDataModel = UploadData(SongName: "https://music.yandex.ru/album/4066489/track/33274678", PlatID: "1")

import Foundation
import SwiftUI
// Create model


//struct UploadData: Codable {
//    var song_url = "https://music.yandex.ru/album/4066489/track/33274678"
//    var service = 1
//}
struct LoadedData: Decodable
{
    var url: String
}

public class Api: ObservableObject
{
    @Published var get: String = "none"
    @EnvironmentObject var platformID: PlatformID
    @Published var Song_URL: String = ""
    @Published var ServiceNAME = UserDefaults.standard.string(forKey: "Service")
 
 
    
    func getSongs()
    {
        let ServerUrl = URL(string: "https://avhook.ru/search")
        
        
        guard let requestUrl = ServerUrl else { fatalError() }
        var request = URLRequest(url: requestUrl)
        request.httpMethod = "POST"
        request.setValue("Application/json", forHTTPHeaderField: "Content-Type")
       
        let postString:[String:Any] =
            [
            "song_url": Song_URL,
            "service": ServiceNAME ?? "None"
            ]
        let jsonData = try? JSONSerialization.data(withJSONObject: postString, options: JSONSerialization.WritingOptions())
        
        request.httpBody = jsonData

        
        URLSession.shared.dataTask(with: request)
        {
            (data, response, error) in

            guard error == nil else
            {
                print ("Error!!!")
                return
                
            }
            guard let data = data else {return}
               do
            {
                let dataString = try JSONDecoder().decode(LoadedData.self, from: data)
                DispatchQueue.main.async
                {
                    self.get = dataString.url
                }
            }
            catch
            {
                print("Error with decoding")
            }
//                let dataString = String(data: data, encoding: .utf8)
//            {
//                        print("Response data string:\n \(dataString)")
//                DispatchQueue.main.async
//                {
//                    self.get = dataString
//                   // let loadedData: [LoadedData] = (try JSONDecoder().decode([LoadedData].self, from: data))
//                    //LoadedData.url = dataString
//                }
//            }
        } .resume()
    }
}

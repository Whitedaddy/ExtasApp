//
//  Escaping.swift
//  Extas
//
//  Created by MacBook on 09.02.2022.
//

import Foundation


class downloade :ObservableObject
{
    func GetNewSong ()
    {
        guard let requestUrl = URL(string: SingleURL) else { return }
        var request = URLRequest(url: requestUrl)
        request.httpMethod = "POST"
        request.setValue("Application/json", forHTTPHeaderField: "Content-Type")
        let postString:[String:Any] =
             [
             "song_url": "https://music.yandex.ru/album/4066489/track/33274678",
             "service": "Spotify"
             ]
        let jsonData = try? JSONSerialization.data(withJSONObject: postString, options: JSONSerialization.WritingOptions())
        request.httpBody = jsonData
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            
            guard let data = data
            else {print("NoData"); return}
            
            guard error == nil
            else {print("Error: \(String(describing: error))"); return}
            
            guard let response = response as? HTTPURLResponse
            else { print("Invalid response"); return}
            
            guard response.statusCode >= 200 && response.statusCode < 300 else {
                print("status code : \(response.statusCode)")
                return
            }
            
            print("SUCCESSFULLY downloaded data")
            print(data)
            let JSONString = String(data: data, encoding: String.Encoding.utf8)
            print(JSONString!)
            
        }.resume()
    }
}

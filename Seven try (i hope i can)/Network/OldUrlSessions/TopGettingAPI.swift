//
//  TopGettingAPI.swift
//  Extas
//
//  Created by MacBook on 09.02.2022.
//

import Foundation


extension BackConnection // Top
{
    func GetTop(PlaceLimit: Int)
    {
        let ServerUrl = URL(string: TopUrl)
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

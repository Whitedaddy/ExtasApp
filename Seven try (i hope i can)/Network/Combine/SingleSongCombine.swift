//
//  CombineAPI.swift
//  Extas
//
//  Created by MacBook on 09.02.2022.
//

import Foundation
import Combine

//let backData = try JSONDecoder().decode(ParsedSong.self, from: data)
class SingleSongCombine: ObservableObject
{
    @Published var MainExchangeButtonOn: Bool = false
    @Published var OldSongUrl: String = ""
    @Published var NewSong: ParsedSong = ParsedSong(url: "None")
    var cancellables = Set<AnyCancellable>()
    
    func GetSingleSong (songURL:String, Service: String)
    {
        guard let requestUrl = URL(string: SingleURL) else { return }
        var request = URLRequest(url: requestUrl)
        request.httpMethod = "POST"
        request.setValue("Application/json", forHTTPHeaderField: "Content-Type")
        let postString:[String:Any] = [
             "song_url": songURL,
             "service": Service ]
        let jsonData = try? JSONSerialization.data(withJSONObject: postString, options: JSONSerialization.WritingOptions())
        request.httpBody = jsonData
        
        URLSession.shared.dataTaskPublisher(for: request)
            .receive(on: DispatchQueue.main)
            .tryMap { (data, response) -> Data  in
                guard let response = response as? HTTPURLResponse,
                      response.statusCode >= 200 && response.statusCode < 300
                else    { throw URLError(.badServerResponse) }
                if let JSONString = String(data: data, encoding: String.Encoding.utf8) {
                   print(JSONString)
                }
                return data
            }
            .decode(type: ParsedSong.self, decoder: JSONDecoder())
            .sink { completion in
                print("Completion: \(completion)")
                print(self.NewSong.url)
            } receiveValue: { [weak self] parsedsong in
                self?.NewSong = parsedsong
                self!.MainExchangeButtonOn = false
            }
            .store(in: &cancellables)

    }
}

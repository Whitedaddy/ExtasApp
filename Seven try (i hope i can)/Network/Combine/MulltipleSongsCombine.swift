//
//  MulltipleSongsCombine.swift
//  Extas
//
//  Created by MacBook on 09.02.2022.
//

import Foundation
import Combine


class MultibleSongsCombine: ObservableObject
{
    var cancellables = Set<AnyCancellable>()
    @Published var songs = CurrentValueSubject<[Song], Never>([Song]())
    @Published var isdownloaded: Bool = false
    
    
    
    func GetMultipleSongs (songURL:String)
    {
        guard let requestUrl = URL(string: MultipleUrl) else { return }
        var request = URLRequest(url: requestUrl)
        request.httpMethod = "POST"
        request.setValue("Application/json", forHTTPHeaderField: "Content-Type")
        let postString:[String:Any] = ["song_url": songURL]
        let jsonData = try? JSONSerialization.data(withJSONObject: postString, options: JSONSerialization.WritingOptions())
        request.httpBody = jsonData
        
        URLSession.shared.dataTaskPublisher(for: request)
            .receive(on: RunLoop.main)
            .tryMap { (data, response) -> Data  in
                guard let response = response as? HTTPURLResponse,
                      response.statusCode >= 200 && response.statusCode < 300
                else    { throw URLError(.badServerResponse) }
                if let JSONString = String(data: data, encoding: String.Encoding.utf8) {
                   print(JSONString)
                }
                return data
            }
            .decode(type: ParsedSongs.self, decoder: JSONDecoder())
            .sink { completion in
                print("Completion: \(completion)")
            } receiveValue: { [weak self] parsedsongs in
                self?.songs.value = parsedsongs.urls
                self?.isdownloaded.toggle() 
            }
            .store(in: &cancellables)

    }
}

//
//  TopCombine.swift
//  Extas
//
//  Created by MacBook on 09.02.2022.
//

import Foundation
import Combine


class TopCombine: ObservableObject
{
    var cancellables = Set<AnyCancellable>()
    @Published var Tracksss: [track] = []
    @Published var IsTopDownloaded: Bool = false
    
    func GetTop (PlaceLimit: Int)
    {
        guard let requestUrl = URL(string: TopUrl) else { return }
        var request = URLRequest(url: requestUrl)
        request.httpMethod = "POST"
        request.setValue("Application/json", forHTTPHeaderField: "Content-Type")
        let TopLimit: [String : Int] = ["limit" : PlaceLimit]
        let jsonData = try? JSONSerialization.data(withJSONObject: TopLimit, options: JSONSerialization.WritingOptions())
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
            .decode(type: ParsedTOP.self, decoder: JSONDecoder())
            .sink { completion in
                print("Completion: \(completion)")
            } receiveValue: { [weak self] parsedsongs in
                self?.Tracksss = parsedsongs.tracks
                self!.IsTopDownloaded.toggle()
            }
            .store(in: &cancellables)

    }
}

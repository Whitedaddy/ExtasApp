//
//  ActionViewController.swift
//  ActionShareLink
//
//  Created by MacBook on 08.12.2021.
//

import UIKit
import MobileCoreServices
import UniformTypeIdentifiers
import SwiftUI
import SnapKit
import Combine

class ActionViewController: UIViewController {
    
    
    var cancellables = Set<AnyCancellable>()
    @Published var songs: [Song] = []
    @Published var isdownloaded: Bool = false
    
    let fuckingRectangle = UIView()
    let entryLabel = UILabel()
    var links = [UIButton]()
    var loadingIndicator = UIActivityIndicatorView()
    var errorLabel = UILabel ()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Initconstants()
        
        if let inputItem = extensionContext?.inputItems.first as? NSExtensionItem
        {
            if let itemProvider = inputItem.attachments?.first
            {
                itemProvider.loadItem(forTypeIdentifier: kUTTypePropertyList as String)
                {
                    [self] (dict, error) in
                    guard let itemDictionary = dict as? NSDictionary else { return }
                    guard let javaScriptValues = itemDictionary[NSExtensionJavaScriptPreprocessingResultsKey] as? NSDictionary else { return }
                    let Pageurl = javaScriptValues["URL"] as? String ?? "None"
                    print(Pageurl)
                    MakeRequest(songURL: Pageurl)
                }
            }
        }
        
    }
    
    
    private func Initconstants ()
    {
        fuckingRectangle.backgroundColor = .black
        view.addSubview(fuckingRectangle)
        fuckingRectangle.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.top.equalToSuperview().inset(Get_Height(h: 0.06))
            make.width.equalTo(Get_Width(w: 1))
            make.height.equalTo(Get_Height(h: 1))
        }
        
        entryLabel.font = scriptFont(size: 0.03)
        entryLabel.text = "Открывай на любой платформе!💟"
        entryLabel.textColor = .white
        view.addSubview(entryLabel)
        entryLabel.snp.makeConstraints
        { make in
            make.left.equalToSuperview().inset(Get_Width(w: 0.05))
            make.right.equalToSuperview().inset(Get_Width(w: 0.05))
            make.topMargin.equalToSuperview().inset(Get_Height(h: 0.1))
        }
        
        view.addSubview(loadingIndicator)
        loadingIndicator.startAnimating()
        loadingIndicator.transform = CGAffineTransform(scaleX: 3, y: 3)
        loadingIndicator.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
        
    }
    
    private func InitButtons ()
    {
        loadingIndicator.removeFromSuperview()
        for (id, service) in songs.enumerated()
        {
            let link = UIButton(type: .system)
            link.titleLabel?.textAlignment = .center
            link.setTitle(service.service_name, for: .normal)
            link.titleLabel?.font = scriptFont(size: 0.03)
            link.backgroundColor = .black.withAlphaComponent(0.9)
            link.layer.cornerRadius = 40
            link.layer.shadowColor = UIColor(red: 0.455, green: 0.059, blue: 0.741, alpha: 1.0).cgColor
            link.layer.shadowOffset = CGSize(width: 0.5, height: 0.5)
            link.layer.shadowRadius = 20
            link.layer.shadowOpacity = 1.0
            
            view.addSubview(link)
            link.snp.makeConstraints
            { make in
                make.centerX.equalToSuperview()
                make.height.equalTo(Get_Height(h: 0.08))
                make.width.equalTo(Get_Width(w: 0.8))
                make.topMargin.equalTo(entryLabel).inset(Get_Height(h: 0.1 + 0.1 * CGFloat(links.count)) )
            }
        
            link.tag = id
            link.addTarget(self, action: #selector(LinkTapped(sender: )), for: .touchUpInside)
            
            links.append(link)
        }
    }
    
    private func InitError ()
    {
        loadingIndicator.removeFromSuperview()

        errorLabel.font = scriptFont(size: 0.03)
        errorLabel.text = "Произошла какая-то ошибка"
        errorLabel.textColor = .white
        view.addSubview(errorLabel)
        errorLabel.snp.makeConstraints
        { make in
            make.center.equalToSuperview()
        }
    }
    
    @objc private func LinkTapped (sender: UIButton)
    {
        print(sender.tag)
        let url = songs[sender.tag].song_url
        print(url)
        openUrl(url: URL(string: songs[sender.tag].song_url)!)
    }
    
    private func MakeRequest (songURL:String)
    {
        
        print("Start request")
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
                //Completion: failure
                switch completion
                {
                case .failure:
                    self.InitError()
                case .finished:
                    break
                }
            } receiveValue: { [weak self] parsedsongs in
                self?.songs = parsedsongs.urls
                self?.isdownloaded.toggle()
                self?.InitButtons()
            }
            .store(in: &cancellables)

    }
    
    private func openUrl(url: URL?) {
        let selector = sel_registerName("openURL:")
        var responder = self as UIResponder?
        while let r = responder, !r.responds(to: selector) {
            responder = r.next
        }
        _ = responder?.perform(selector, with: url)
    }
    
    @IBAction func done()
    {
        self.extensionContext!.completeRequest(returningItems: self.extensionContext!.inputItems, completionHandler: nil)
    }
    
}


func scriptFont(size: CGFloat) -> UIFont {
    guard let customFont = UIFont(name: "Rawer-CondensedThin", size: Get_Height(h: size)) else {
        return UIFont.systemFont(ofSize: size)
    }
    return customFont
}


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

class ActionViewController: UIViewController {
    
    @ObservedObject var backConnection = BackConnection ()
    
    //test
    var Pageurl = "https://avhook.ru/"
    var New_URL = URL (string: "https://avhook.ru/")
    var PlatformChosen = "none"
    //var serv1 = UserDefaults.standard.string(forKey: "Service")

    var SafariURL: NSURL!

    override func viewDidLoad() {
        super.viewDidLoad()

        if let inputItem = extensionContext?.inputItems.first as? NSExtensionItem {
               if let itemProvider = inputItem.attachments?.first {
                   itemProvider.loadItem(forTypeIdentifier: kUTTypePropertyList as String) { [self] (dict, error) in
                       guard let itemDictionary = dict as? NSDictionary else { return }
                       guard let javaScriptValues = itemDictionary[NSExtensionJavaScriptPreprocessingResultsKey] as? NSDictionary else { return }
                       self.Pageurl = javaScriptValues["URL"] as? String ?? "None"
                       print(Pageurl)
                       let userDefaults = UserDefaults(suiteName: "group.mot.Seven-try--i-hope-i-can-")
                       let PlatformChosen = userDefaults!.string(forKey: "Service")
                       print(PlatformChosen!)
                       FastSongOpen(songURL: Pageurl, Service: PlatformChosen!)
                   }
               }
           }
    }

    @IBAction func done()
    {
        self.extensionContext!.completeRequest(returningItems: self.extensionContext!.inputItems, completionHandler: nil)
    }

    func openUrl(url: URL?) {
        let selector = sel_registerName("openURL:")
        var responder = self as UIResponder?
        while let r = responder, !r.responds(to: selector) {
            responder = r.next
        }
        _ = responder?.perform(selector, with: url)
    }
    
    
    func FastSongOpen(songURL:String, Service: String)
    {
        let ServerUrl = URL(string: "https://extas.space/search/single")
        
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
                 return
             }
             
             guard let data = data else {return}
                         if let JSONString = String(data: data, encoding: String.Encoding.utf8) {
                            print(JSONString)  }
                do
             {
                 let backData = try JSONDecoder().decode(ParsedSong.self, from: data)
                 DispatchQueue.main.async
                 {
                     self.New_URL = URL (string: backData.url)
                     self.openUrl(url: self.New_URL)
                 }
             }
             catch
             {
                 print("Error with decoding")
             }
         } .resume()
    }
}

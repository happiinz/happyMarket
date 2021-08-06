//
//  NetworkManager.swift
//  SevenElevenWidgetsExtension
//
//  Created by Pratchaya Yordming on 24/7/2564 BE.
//

import SwiftUI

class NetworkManager {
    static var shared = NetworkManager()
    
    func getData(completion: @escaping (JSONModel)->Void) {
        let url = "https://happy-market-widget.herokuapp.com/widget-contents"
        let session = URLSession(configuration: .default)
        
        session.dataTask(with: URL(string: url)!) { data, _, err in
            if err != nil {
                print(err?.localizedDescription ?? "")
                return
            }
            
            do{
                let jsonData = try JSONDecoder().decode(JSONModel.self, from: data!)
                print(jsonData)
                completion(jsonData)
            }catch {
                print(err?.localizedDescription ?? "")
                completion(JSONModel(point: 0,
                                     promotion: JSONModel.Promotion(image: "")))
            }
        }.resume()
    }
}

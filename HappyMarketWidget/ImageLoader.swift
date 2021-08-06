//
//  ImageLoader.swift
//  SevenElevenWidgetsExtension
//
//  Created by Pratchaya Yordming on 24/7/2564 BE.
//

import SwiftUI

class ImageLoader {
    static var shared = ImageLoader()
    
    func downloadWebImage(imageUrl: String, completion: @escaping (UIImage)->Void) {
        guard let url = URL(string: imageUrl) else {
            return
        }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if error != nil {
                completion(UIImage(named: "placeholder")!)
                debugPrint("error: \(String(describing: error))")
            }else {
                if let data = data,
                   let image = UIImage(data: data) {
                    completion(image)
                    debugPrint("success: \(data)")
                } else {
                    completion(UIImage(named: "placeholder")!)
                    debugPrint("error: \(String(describing: error))")
                }
            }
        }.resume()
    }
}

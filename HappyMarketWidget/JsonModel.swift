//
//  JsonModel.swift
//  SevenElevenWidgetsExtension
//
//  Created by Pratchaya Yordming on 28/7/2564 BE.
//

struct JSONModel: Codable {
    var point: Int
    var promotion: Promotion
    
    struct Promotion: Codable {
        var image: String
    }
}

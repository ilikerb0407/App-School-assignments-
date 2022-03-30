//
//  Model.swift
//  GCD
//
//  Created by Kai Fu Jhuang on 2022/3/30.
//

import Foundation

import Foundation

struct SpeedRestrictResponse: Codable {
    var result: Results
}

struct Results: Codable {
    let limit, offset: Int
    var results: [Results]
  
}
struct Results: Codable {
    
    let road, speed: String
//    let 設置路段, 速限: String


    enum CodingKeys: String, CodingKey {
        
        case road = "設置路段"
        case speed = "速限"
//        case 設置路段, 速限
    }
}

//
//  allData.swift
//  W4-3-1
//
//  Created by 莊凱富 on 2022/1/27.
//

import Foundation

struct allData : Decodable {
    //Instance method 'decode(_:from:)' requires that 'allData' conform to 'Decodable'
    var stationID : String
    var stationName : String
    var stationAddress : String
}

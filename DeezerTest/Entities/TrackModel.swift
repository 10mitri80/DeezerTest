//
//  TrackModel.swift
//  DeezerTest
//
//  Created by Dimitri Cadars on 18-09-19.
//  Copyright © 2018 Dimitri Cadars. All rights reserved.
//

import Foundation
import ObjectMapper

struct TrackModel {
    var id = 0
    var name = ""
    var preview = ""
}

extension TrackModel: Mappable {
    
    init?(map: Map) {
    }
    
    mutating func mapping(map: Map) {
        id       <- map["id"]
        name     <- map["title"]
        preview     <- map["preview"]
    }
}

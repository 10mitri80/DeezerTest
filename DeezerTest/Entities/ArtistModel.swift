//
//  ArtistModel.swift
//  DeezerTest
//
//  Created by Dimitri Cadars on 18-09-17.
//  Copyright © 2018 Dimitri Cadars. All rights reserved.
//

import Foundation
import ObjectMapper

struct ArtistModel {
    var id = 0
    var name = ""
    var pictureUrl = ""
}

extension ArtistModel: Mappable {
    
    init?(map: Map) {
    }
    
    mutating func mapping(map: Map) {
        id       <- map["id"]
        name     <- map["name"]
        pictureUrl     <- map["picture"]
    }
}

//
//  Places.swift
//  StarbucksCCH
//
//  Created by Silvio Bulla on 25/06/2019.
//  Copyright © 2019 Silvio Bulla. All rights reserved.
//

import Foundation

struct Place: Decodable {
    
    var formatted_address: String
    var icon: String
    var name: String
    var geometry: Geometry
    
    init() {
        formatted_address = ""
        icon = ""
        name = ""
        geometry = Geometry()
    }
}

struct Geometry: Decodable {
    
    var location: Location
    
    init() {
        location = Location()
    }
}

struct Location: Decodable {
    
    var lat: Double
    var lng: Double
    
    init() {
        lat = 41.3275
        lng = 19.8187
    }
}

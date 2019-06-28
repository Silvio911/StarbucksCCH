//
//  Settings.swift
//  StarbucksCCH
//
//  Created by Silvio Bulla on 26/06/2019.
//  Copyright © 2019 Silvio Bulla. All rights reserved.
//

import Foundation

//MARK:-Base url

struct Config{
    static let baseUrl = "https://maps.googleapis.com/maps/api/"
}

//MARK:-URLSession configurations

func setConfigs() -> URLSession{
    var config :URLSessionConfiguration!
    var urlSession :URLSession!
    config = URLSessionConfiguration.default
    urlSession = URLSession(configuration: config)
    return urlSession
}

//MARK:-Endpoints

struct ApiAddesses{
    static let placeSearchUrl = "place/textsearch/json?query="
    static let sensorKey = "&sensor=false&key="
    
    //MARK:-This key can expire && we have to delete it bcs it is a sensitive information xp.
    static let key = "AIzaSyCmhk7MY_Bh4t_Bd-G03FYW6qOEeQlfTfc"
}

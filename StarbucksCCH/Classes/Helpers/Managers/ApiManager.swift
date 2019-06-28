//
//  ApiManager.swift
//  StarbucksCCH
//
//  Created by Silvio Bulla on 26/06/2019.
//  Copyright © 2019 Silvio Bulla. All rights reserved.
//

import Foundation

class ApiManager{
    
    //MARK:- Generic get data.
    
    func getData<T: Decodable>(urlString:String, completionHandler: @escaping (_ success: Bool, _ data: [T]) -> ()) {
        var fetchedData: [T] = []
       
        let apiUrl = URL.init(string: urlString)
        let urlSession = setConfigs()
        let request : URLRequest = URLRequest.init(url: apiUrl!)
        let dataTask = urlSession.dataTask(with: request) { (data, response, error) in
            guard error == nil else {
                completionHandler(false, [T]())
                return
            }
            if let data = data {
                if let results = try? JSONSerialization.jsonObject(with: data, options: .allowFragments) as? NSDictionary{
                    if let status = results.object(forKey: "status"){
                        if status as! String == "OK"{
                           
                            do{
                                //Decode
                                let json = try JSONSerialization.data(withJSONObject: results["results"]!)
                                fetchedData = try JSONDecoder().decode([T].self, from: json)
                                completionHandler(true, fetchedData)
                            }catch {
                                completionHandler(false, [T]())
                            }
                            
                        }else {
                            completionHandler(false, [T]())
                        }
                    }else {
                        completionHandler(false, [T]())
                    }
                }
            }else {
                completionHandler(false, [T]())
            }
        }
        dataTask.resume()
    }
    
}

//
//  Utility.swift
//  StarbucksCCH
//
//  Created by Silvio Bulla on 26/06/2019.
//  Copyright © 2019 Silvio Bulla. All rights reserved.
//

import Foundation
import UIKit

//MARK:- View state manager.
enum ViewState {
    case ok
    case error
}

class Utility: NSObject {
    
    //MARK:- Navigation Bar Appearence.
    class func setupNavBarApparence(){
        UINavigationBar.appearance().shadowImage = UIImage()
        UINavigationBar.appearance().tintColor = UIColor.StarbucksGreen
        UINavigationBar.appearance().barTintColor = .white
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.StarbucksGreen, NSAttributedString.Key.font: UIFont(name: "AvenirNext-Medium", size: 20)!]
        UINavigationBar.appearance().largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.StarbucksGreen, NSAttributedString.Key.font: UIFont(name: "AvenirNext-Bold", size: 25)!]
    }
    
    //MARK:- API full url.
    class func apiURL(base:String, endPoint:String) -> String {
        return "\(base)\(endPoint)"
    }
    
    //MARK:- View.
    class func roundEqualy(of component: UIView) {
        component.layer.cornerRadius = 10
        component.layer.masksToBounds = true
    }
    
    class func makeRounded(_ component: UIImageView) {
        component.layer.cornerRadius = component.frame.width/2
        component.layer.masksToBounds = true
    }
    
}


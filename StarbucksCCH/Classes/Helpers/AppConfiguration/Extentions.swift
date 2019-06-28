//
//  Extentions.swift
//  StarbucksCCH
//
//  Created by Silvio Bulla on 26/06/2019.
//  Copyright © 2019 Silvio Bulla. All rights reserved.
//

import Foundation
import UIKit

extension UIColor {
    
    static var StarbucksGreen: UIColor {
        return UIColor(red: 0/255, green: 112/255, blue: 74/255, alpha: 1.0)
    }
}

extension UIViewController {
    
    //MARK:- Alert Controller.
    public func createAlertWithTitle(title:String?, andMessage message:String?)->UIAlertController{
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .actionSheet)
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alertController.addAction(cancelAction)
        return alertController
    }
}

extension UIStoryboard {
    
    static var main:UIStoryboard {
        return UIStoryboard(name: "Main", bundle: Bundle.main)
    }
    
    static var detailViewController: MapDetailsViewController {
        return UIStoryboard.main.instantiateViewController(withIdentifier: "MapDetailsViewController") as! MapDetailsViewController
    }
    
}

//MARK:- TableViewCell.

extension UITableViewCell {
    static var identifier: String {
        return String(describing: self)
    }
}

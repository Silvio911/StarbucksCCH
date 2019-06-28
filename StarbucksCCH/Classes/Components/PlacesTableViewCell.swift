//
//  PlacesTableViewCell.swift
//  StarbucksCCH
//
//  Created by Silvio Bulla on 25/06/2019.
//  Copyright © 2019 Silvio Bulla. All rights reserved.
//

import UIKit

class PlacesTableViewCell: UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var placeImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        Utility.roundEqualy(of: placeImageView)
    }
    
    func setUpCell(_ model: Place){
        nameLabel.text = model.name
        addressLabel.text = model.formatted_address
        if let url = URL(string: model.icon){
            placeImageView.image = try? UIImage(data: Data(contentsOf: url))
        }else{
            placeImageView.image = UIImage(named: "starbucksIcon")
        }
    }
    
}

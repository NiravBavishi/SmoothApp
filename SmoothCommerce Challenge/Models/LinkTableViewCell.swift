//
//  LinkTableViewCell.swift
//  SmoothCommerce Challenge
//
//  Created by Nirav Bavishi on 2020-07-22.
//  Copyright © 2020 Nirav Bavishi. All rights reserved.
//

import UIKit
import SafariServices

class LinkTableViewCell: UITableViewCell {

    
    
    
    @IBOutlet weak var urlLabel: UILabel!
    
    var url: String = ""
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func setURL(url: String){
        
        
        urlLabel.text = url
        
    }
    
}

//
//  TextTableViewCell.swift
//  SmoothCommerce Challenge
//
//  Created by Nirav Bavishi on 2020-07-22.
//  Copyright © 2020 Nirav Bavishi. All rights reserved.
//

import UIKit

class TextTableViewCell: UITableViewCell {

    @IBOutlet weak var textLable: UILabel!
    
    @IBOutlet weak var dataTextLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

     func setData(textData: String){
        
        dataTextLabel.text = textData
        
    }
    
}

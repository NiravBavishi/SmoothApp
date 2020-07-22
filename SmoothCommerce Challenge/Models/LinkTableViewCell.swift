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

    
    
    @IBOutlet weak var linkButton: UIButton!
    
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
        
        self.url = url
        linkButton.setTitle(url, for: .normal)
        
    }
    
    @IBAction func linkButtonTapped(_ sender: Any) {
        
       
        guard let url = URL(string: self.url) else { return }
        UIApplication.shared.open(url)
        
    }
}

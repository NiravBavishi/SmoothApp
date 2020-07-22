//
//  Extensions.swift
//  SmoothCommerce Challenge
//
//  Created by Nirav Bavishi on 2020-07-22.
//  Copyright © 2020 Nirav Bavishi. All rights reserved.
//

import Foundation
import UIKit

extension UIImageView {
    func load(url: String) {
        
        let actualURL = URL(string: url)
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: actualURL!) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}

//
//  ImageView+Weather.swift
//  WeatherApp
//
//  Created by vasanth on 5/8/19.
//  Copyright © 2019 vasanth. All rights reserved.
//

import Foundation
import UIKit

extension UIImageView {
    
    public func imgIcon(_ icon: String) {
        let urlString = icon
        if let url = URL(string: urlString) {
            DispatchQueue.global().async {
                if let dataImg = try? Data(contentsOf: url), let image = UIImage(data: dataImg) {
                    DispatchQueue.main.async {
                        self.image = image
                    }
                }
            }
        }
    }
}

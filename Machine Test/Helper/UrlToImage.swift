//
//  UrlToImage.swift
//  Machine Test
//
//  Created by Sourabh Jain on 29/04/20.
//  Copyright © 2020 Sourabh Jain. All rights reserved.
//

import Foundation
import UIKit

class UrlToImage {
    static let shared  = UrlToImage()
    
    //  Get Image URL From JSON
    
    func getImage(from string: String) -> UIImage? {
       //2. Get valid URL
       guard let url = URL(string: string)
           else {
               print("Unable to create URL")
               return nil
       }

       var image: UIImage? = nil
       do {
           //3. Get valid data
           let data = try Data(contentsOf: url, options: [])

           //4. Make image
           image = UIImage(data: data)
       }
       catch {
        image = #imageLiteral(resourceName: "—Pngtree—vector female avatar icon_3792351")
           print(error.localizedDescription)
        return image
       }
        return image
    }
    
    func circleImageAvatar(image: UIImageView) {
        image.layer.borderWidth = 1.0
        image.layer.masksToBounds = false
        image.layer.borderColor = UIColor.white.cgColor
        image.layer.cornerRadius = image.frame.size.width / 2
        image.clipsToBounds = true
    }
}

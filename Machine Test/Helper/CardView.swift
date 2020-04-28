//
//  CardView.swift
//  Machine Test
//
//  Created by Sourabh Jain on 29/04/20.
//  Copyright © 2020 Sourabh Jain. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable class CardView: UIView {
    
    @IBInspectable var cornerRadious: CGFloat = 0
    @IBInspectable var shadowColor: UIColor? = UIColor.black
    @IBInspectable var shadowOffSetWidth: Int = 0
    @IBInspectable var shadowOffSetHeight: Int = 1
    @IBInspectable var shadowOpacity: Float = 0.2
    
    override func layoutSubviews() {
        layer.cornerRadius = cornerRadious
        layer.shadowColor = shadowColor?.cgColor
        layer.shadowOffset = CGSize(width: shadowOffSetWidth, height: shadowOffSetHeight)
        let shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: cornerRadious)
        layer.shadowPath = shadowPath.cgPath
        layer.shadowOpacity = shadowOpacity
    }




    
}

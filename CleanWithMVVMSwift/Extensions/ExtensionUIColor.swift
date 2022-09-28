//
//  ExtensionUIColor.swift
//  CleanWithMVVMSwift
//
//  Created by Amais Sheikh on 03/04/2022.
//

import UIKit

extension UIColor
{
    convenience init(hex: UInt, alpha: CGFloat = 1)
    {
        self.init(red: CGFloat((hex & 0xFF0000) >> 16) / 255.0,
                  green: CGFloat((hex & 0x00FF00) >> 8) / 255.0,
                  blue: CGFloat(hex & 0x0000FF) / 255.0,
                  alpha: alpha)
    }
    
    static var cream: UIColor
    {
        get
        { return UIColor(hex: 0xFFDAB9) }
    }
    
    static var pinkLevel1: UIColor
    {
        get
        { return UIColor(hex: 0xFBC4AB) }
    }
    
    static var pinkLevel2: UIColor
    {
        get
        { return UIColor(hex: 0xF8AD9D) }
    }
    
    static var pinkLevel3: UIColor
    {
        get
        { return UIColor(hex: 0xF4978E) }
    }
    
    static var pinkLevel4: UIColor
    {
        get
        { return UIColor(hex: 0xF08080) }
    }
}

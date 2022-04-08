//
//  ExtensionUIFont.swift
//  CleanWithMVVMSwift
//
//  Created by Amais Sheikh on 03/04/2022.
//

import UIKit

extension UIFont
{
    static func austieBostKittenKlub(ofSize size: CGFloat) -> UIFont
    {
        let font = UIFont(name: "AustieBostKittenKlub", size: size)
        return font ?? UIFont.systemFont(ofSize: size)
    }
}

//
//  ExtensionUIImageView.swift
//  CleanWithMVVMSwift
//
//  Created by Amais Sheikh on 09/04/2022.
//

import UIKit

extension UIImageView
{
    func loadImageFrom(url: String)
    {
        CatImageCacheManager.shared.getImage(fromUrl: url)
        { image in
            
            DispatchQueue.main.async
            { self.image = image }
        }
    }
}

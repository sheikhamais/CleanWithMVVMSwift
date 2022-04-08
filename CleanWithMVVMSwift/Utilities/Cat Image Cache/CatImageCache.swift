//
//  CatImageCache.swift
//  CleanWithMVVMSwift
//
//  Created by Amais Sheikh on 09/04/2022.
//

import UIKit

class CatImageCacheManager
{
    private init() {}
    static let shared = CatImageCacheManager()
    
    let cache = NSCache<NSString, UIImage>()
    
    func getImage(fromUrl: String, completion: @escaping (UIImage) -> Void)
    {
        if let values = cache.value(forKey: "allObjects") as? NSArray
        {
            for key in values
            {
                print(key)
            }
        }
        
        let nsUrl = NSString(string: fromUrl)
        if let image = cachedImage(forUrl: nsUrl)
        {
            print("From function: \(#function) => got image from cache")
            completion(image)
        }
        else
        {
            print("From function: \(#function) => loading image from url")
            guard let url = URL(string: fromUrl)
            else { return }
            
            guard let imageData = try? Data(contentsOf: url)
            else { return }
            
            guard let image = UIImage(data: imageData)
            else { return }
            
            cache.setObject(image, forKey: nsUrl)
            completion(image)
        }
    }
    
    private func cachedImage(forUrl: NSString) -> UIImage?
    {
        let image = cache.object(forKey: forUrl)
        return image
    }
}

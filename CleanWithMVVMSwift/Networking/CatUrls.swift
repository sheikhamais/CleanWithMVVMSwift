//
//  CatUrls.swift
//  CleanWithMVVMSwift
//
//  Created by Amais Sheikh on 03/04/2022.
//

import Foundation

class CatUrls
{
    private static var baseCatUrl: String =
        {
            "https://api.catboys.com"
        }()
    
    //----------------------------------------------------------------------------------
    //MARK: - Public Api Urls
    //----------------------------------------------------------------------------------
    
    static var pingUrl: URL?
        {
            return URL(string: baseCatUrl + "/ping")
        }
    
    static var imgUrl: URL?
        {
            return URL(string: baseCatUrl + "/img")
        }
    
    static var bakaUrl: URL?
        {
            return URL(string: baseCatUrl + "/baka")
        }
    
    static var ballUrl: URL?
        {
            return URL(string: baseCatUrl + "/8ball")
        }
    
    static var diceUrl: URL?
        {
            return URL(string: baseCatUrl + "/dice")
        }
    
    static var catboyUrl: URL?
        {
            return URL(string: baseCatUrl + "/catboy")
        }
}

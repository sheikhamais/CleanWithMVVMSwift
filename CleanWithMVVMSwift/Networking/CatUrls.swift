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
    //MARK:- Public Api Urls
    //----------------------------------------------------------------------------------
    
    static var pingUrl: String
        {
            baseCatUrl + "/ping"
        }
    
    static var imgUrl: String
        {
            baseCatUrl + "/img"
        }
    
    static var bakaUrl: String
        {
            baseCatUrl + "/baka"
        }
    
    static var ballUrl: String
        {
            baseCatUrl + "/8ball"
        }
    
    static var diceUrl: String
        {
            baseCatUrl + "/dice"
        }
    
    static var catboyUrl: String
        {
            baseCatUrl + "/catboy"
        }
}

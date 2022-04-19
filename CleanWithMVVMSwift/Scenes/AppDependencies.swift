//
//  AppDependencies.swift
//  CleanWithMVVMSwift
//
//  Created by Khalil-Mhelheli on 19/4/2022.
//

import Foundation
import UIKit

class AppDependencies {
    var window: UIWindow?
    private init(){
        
    }
    
    static let shared = AppDependencies()
}

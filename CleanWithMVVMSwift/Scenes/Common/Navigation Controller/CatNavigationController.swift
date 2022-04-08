//
//  CatNavigationController.swift
//  CleanWithMVVMSwift
//
//  Created by Amais Sheikh on 08/04/2022.
//

import UIKit

class CatNavigationController: UINavigationController
{
    //------------------------------------------------------------
    //MARK:- Variables
    //------------------------------------------------------------
    
    //------------------------------------------------------------
    //MARK:- Initializers
    //------------------------------------------------------------
    
    override init(rootViewController: UIViewController) {
        super.init(rootViewController: rootViewController)
        navigationBar.isHidden = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //------------------------------------------------------------
    //MARK:- Configure UI Methods
    //------------------------------------------------------------
}

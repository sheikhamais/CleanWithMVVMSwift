//
//  HomeRouter.swift
//  CleanWithMVVMSwift
//
//  Created by Amais Sheikh on 03/04/2022.
//

import UIKit

protocol HomeRouterProtocol
{
    func routeToPokeViewController(catSaid: String)
    func routeToBaka()
}

class HomeRouter: HomeRouterProtocol
{
    //----------------------------------------------------------------------------------
    //MARK:- SectionName
    //----------------------------------------------------------------------------------
    
    weak var viewController: UIViewController?
    
    //----------------------------------------------------------------------------------
    //MARK:- SectionName
    //----------------------------------------------------------------------------------
    
    func routeToPokeViewController(catSaid: String)
    {
        let vc = PokeViewController(catSaid: catSaid)
        self.viewController?.present(vc, animated: true)
    }
    
    func routeToBaka()
    {
        let vc = BakaViewController()
        self.viewController?.navigationController?.pushViewController(vc, animated: true)
    }
}

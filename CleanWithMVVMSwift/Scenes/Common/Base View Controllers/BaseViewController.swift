//
//  BaseViewController.swift
//  CleanWithMVVMSwift
//
//  Created by Amais Sheikh on 03/04/2022.
//

import UIKit

class BaseViewController: UIViewController
{
    //---------------------------------------------------------------------------------------------------------
    //MARK:- Data memebers
    //---------------------------------------------------------------------------------------------------------
    
    override var preferredStatusBarStyle: UIStatusBarStyle
    { return .darkContent }
    
    //----------------------------------------------------------------------------------
    //MARK:- SectionName
    //----------------------------------------------------------------------------------
    
    init()
    {
        super.init(nibName: nil, bundle: nil)
        configurator()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //---------------------------------------------------------------------------------------------------------
    //MARK:- Life cycle
    //---------------------------------------------------------------------------------------------------------
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        configureUI()
        bindViews()
    }
    
    //---------------------------------------------------------------------------------------------------------
    //MARK:- Configure UI
    //---------------------------------------------------------------------------------------------------------
    
    func configurator()
    { }
    
    func configureUI()
    {
        //properties
        view.backgroundColor = .white
        
        //subviews
        //constraints
    }
    
    func bindViews()
    { }
    
    func showIndicator()
    {
        DispatchQueue.main.async
        { ProgressIndicator.shared.showActivityIndicator(inView: self.view) }
    }
    
    func hideIndicator()
    {
        DispatchQueue.main.async
        { ProgressIndicator.shared.hideActivityIndicator(fromView: self.view) }
    }
    
    func showErrorAlert(withMessage: String, completion: VoidHandler? = nil)
    {
        DispatchQueue.main.async
        { self.showSingleButtonAlert(withTitle: "Error", withMessage: withMessage, completion: completion) }
    }
    
    //---------------------------------------------------------------------------------------------------------
    //MARK:- Functionality
    //---------------------------------------------------------------------------------------------------------
    
    //---------------------------------------------------------------------------------------------------------
    //MARK:- @objc methods
    //---------------------------------------------------------------------------------------------------------
}

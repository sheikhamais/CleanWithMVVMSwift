//
//  PokeViewController.swift
//  CleanWithMVVMSwift
//
//  Created by Amais Sheikh on 04/04/2022.
//

import UIKit

class PokeViewController: BaseViewController
{
    //---------------------------------------------------------------------------------------------------------
    //MARK:- Data memebers
    //---------------------------------------------------------------------------------------------------------
    
    var content: PokeViewControllerUI =
        {
            let obj = PokeViewControllerUI()
            obj.translatesAutoresizingMaskIntoConstraints = false
            return obj
        }()
    
    //dependencies
    private var catSaid: String
    
    //----------------------------------------------------------------------------------
    //MARK:- SectionName
    //----------------------------------------------------------------------------------
    
    init(catSaid: String)
    {
        self.catSaid = catSaid
        super.init()
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
    }
    
    //---------------------------------------------------------------------------------------------------------
    //MARK:- Configure UI
    //---------------------------------------------------------------------------------------------------------
    
    override func configureUI()
    {
        //properties
        view.backgroundColor = .cream
        content.catSaysLabel.text = catSaid.uppercased()
        
        //subviews
        view.addSubview(content)
        
        //constraints
        NSLayoutConstraint.activate([
            
            content.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            content.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            content.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            content.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    //---------------------------------------------------------------------------------------------------------
    //MARK:- Functionality
    //---------------------------------------------------------------------------------------------------------
    
    //---------------------------------------------------------------------------------------------------------
    //MARK:- @objc methods
    //---------------------------------------------------------------------------------------------------------
}


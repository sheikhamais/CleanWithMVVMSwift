//
//  TableViewBaseViewController.swift
//  CleanWithMVVMSwift
//
//  Created by Amais Sheikh on 03/04/2022.
//

import UIKit

class TableViewBaseViewController: BaseViewController
{
    //---------------------------------------------------------------------------------------------------------
    //MARK:- Data memebers
    //---------------------------------------------------------------------------------------------------------
    
    var tableView: UITableView =
        {
            let obj = UITableView()
            obj.translatesAutoresizingMaskIntoConstraints = false
            obj.backgroundColor = .purple
            return obj
        }()
    
    //---------------------------------------------------------------------------------------------------------
    //MARK:- Life cycle
    //---------------------------------------------------------------------------------------------------------
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        configureUI()
    }
    
    //---------------------------------------------------------------------------------------------------------
    //MARK:- Configure UI
    //---------------------------------------------------------------------------------------------------------
    
    override func configureUI()
    {
        super.configureUI()
        
        //properties
        //subviews
        view.addSubview(tableView)
        
        //constraints
        NSLayoutConstraint.activate([
            
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    //---------------------------------------------------------------------------------------------------------
    //MARK:- Functionality
    //---------------------------------------------------------------------------------------------------------
    
    //---------------------------------------------------------------------------------------------------------
    //MARK:- @objc methods
    //---------------------------------------------------------------------------------------------------------
}


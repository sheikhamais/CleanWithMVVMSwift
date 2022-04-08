//
//  ActionsCollectionViewCell.swift
//  CleanWithMVVMSwift
//
//  Created by Amais Sheikh on 03/04/2022.
//

import UIKit

class ActionsCollectionViewCell: BaseCollectionViewCell
{
    //------------------------------------------------------------
    //MARK:- Variables
    //------------------------------------------------------------
    
    var containerView: UIView =
        {
            let obj = UIView()
            obj.translatesAutoresizingMaskIntoConstraints = false
            obj.backgroundColor = .pinkLevel4
            obj.layer.cornerRadius = 12
            return obj
        }()
    
    var actionTitleLabel: UILabel =
        {
            let obj = UILabel()
            obj.translatesAutoresizingMaskIntoConstraints = false
            obj.text = "Tap Me"
            obj.textColor = .white
            obj.textAlignment = .center
            obj.font = .austieBostKittenKlub(ofSize: 24)
            return obj
        }()
    
    //------------------------------------------------------------
    //MARK:- Configure UI Methods
    //------------------------------------------------------------
    
    override func configureUI()
    {
        contentView.addSubview(containerView)
        contentView.addSubview(actionTitleLabel)
        
        NSLayoutConstraint.activate([
            
            containerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            containerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            containerView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            containerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
           
            actionTitleLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 8),
            actionTitleLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -8),
            actionTitleLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 8),
            actionTitleLabel.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -8)
        ])
    }
}

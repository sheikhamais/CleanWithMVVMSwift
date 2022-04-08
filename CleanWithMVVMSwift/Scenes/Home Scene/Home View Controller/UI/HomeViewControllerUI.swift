//
//  HomeViewControllerUI.swift
//  CleanWithMVVMSwift
//
//  Created by Amais Sheikh on 03/04/2022.
//

import UIKit

extension HomeViewController
{
    class HomeViewControllerUI: UIView
    {
        //----------------------------------------------------------------------------------
        //MARK:- Vars
        //----------------------------------------------------------------------------------
        
        private var followingLabel: UILabel =
            {
                let obj = UILabel()
                obj.translatesAutoresizingMaskIntoConstraints = false
                obj.text = "Cat is doing Clean + MVVM"
                obj.textColor = .black
                obj.font = .austieBostKittenKlub(ofSize: 17)
                return obj
            }()
        
        var actionsCollectionView: UICollectionView =
            {
                let layout = UICollectionViewFlowLayout()
                layout.minimumLineSpacing = 0
                layout.minimumInteritemSpacing = 0
                
                let obj = UICollectionView(frame: .zero, collectionViewLayout: layout)
                obj.translatesAutoresizingMaskIntoConstraints = false
                obj.backgroundColor = .pinkLevel1
                return obj
            }()
        
        //----------------------------------------------------------------------------------
        //MARK:- Init
        //----------------------------------------------------------------------------------
        
        init()
        {
            super.init(frame: .zero)
            configureUI()
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        //----------------------------------------------------------------------------------
        //MARK:- UI Methods
        //----------------------------------------------------------------------------------
        
        private func configureUI()
        {
            //properties
            backgroundColor = .cream
            
            //subviews
            addSubview(followingLabel)
            addSubview(actionsCollectionView)
            
            //cnsts
            NSLayoutConstraint.activate([
                
                followingLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
                followingLabel.topAnchor.constraint(equalTo: topAnchor),
                followingLabel.heightAnchor.constraint(equalToConstant: 100),
                
                actionsCollectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
                actionsCollectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
                actionsCollectionView.topAnchor.constraint(equalTo: followingLabel.bottomAnchor),
                actionsCollectionView.bottomAnchor.constraint(equalTo: bottomAnchor)
            ])
        }
    }
}

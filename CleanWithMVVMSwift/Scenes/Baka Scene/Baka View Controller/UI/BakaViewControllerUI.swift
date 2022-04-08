//
//  BakaViewControllerUI.swift
//  CleanWithMVVMSwift
//
//  Created by Amais Sheikh on 08/04/2022.
//

import UIKit

extension BakaViewController
{
    class BakaViewControllerUI: UIView
    {
        //----------------------------------------------------------------------------------
        //MARK:- Vars
        //----------------------------------------------------------------------------------
        
        private var headingLabel: UILabel =
            {
                let obj = UILabel()
                obj.translatesAutoresizingMaskIntoConstraints = false
                obj.text = "Yolo, See Baka"
                obj.textColor = .black
                obj.textAlignment = .center
                obj.numberOfLines = 0
                obj.font = .austieBostKittenKlub(ofSize: 24)
                return obj
            }()
        
        var bakaImageView: UIImageView =
            {
                let obj = UIImageView()
                obj.translatesAutoresizingMaskIntoConstraints = false
                obj.layer.cornerRadius = 12
                obj.contentMode = .scaleAspectFit
                obj.clipsToBounds = true
                obj.backgroundColor = .green
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
            addSubview(headingLabel)
            addSubview(bakaImageView)
            
            //cnsts
            NSLayoutConstraint.activate([
                
                headingLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
                headingLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
                headingLabel.topAnchor.constraint(equalTo: topAnchor, constant: 32),
                
                bakaImageView.leadingAnchor.constraint(greaterThanOrEqualTo: leadingAnchor, constant: 12),
                bakaImageView.trailingAnchor.constraint(lessThanOrEqualTo: trailingAnchor, constant: -12),
                bakaImageView.topAnchor.constraint(greaterThanOrEqualTo: headingLabel.bottomAnchor, constant: 12),
                bakaImageView.bottomAnchor.constraint(lessThanOrEqualTo: bottomAnchor, constant: -12)
            ])
        }
    }
}

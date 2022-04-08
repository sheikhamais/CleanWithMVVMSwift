//
//  PokeViewControllerUI.swift
//  CleanWithMVVMSwift
//
//  Created by Amais Sheikh on 04/04/2022.
//

import UIKit

extension PokeViewController
{
    class PokeViewControllerUI: UIView
    {
        //----------------------------------------------------------------------------------
        //MARK:- Vars
        //----------------------------------------------------------------------------------
        
        var catSaysLabel: UILabel =
            {
                let obj = UILabel()
                obj.translatesAutoresizingMaskIntoConstraints = false
                obj.text = "Yolo"
                obj.textColor = .black
                obj.textAlignment = .center
                obj.numberOfLines = 0
                obj.font = .austieBostKittenKlub(ofSize: 24)
                return obj
            }()
        
        private var catImageView: UIImageView =
            {
                let obj = UIImageView()
                obj.translatesAutoresizingMaskIntoConstraints = false
                obj.image = UIImage(named: "cat")
                obj.layer.cornerRadius = 12
                obj.contentMode = .scaleAspectFit
                obj.clipsToBounds = true
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
            addSubview(catSaysLabel)
            addSubview(catImageView)
            
            //cnsts
            NSLayoutConstraint.activate([
                
                catSaysLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
                catSaysLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
                catSaysLabel.topAnchor.constraint(equalTo: topAnchor, constant: 32),
                
                catImageView.leadingAnchor.constraint(greaterThanOrEqualTo: leadingAnchor, constant: 12),
                catImageView.trailingAnchor.constraint(lessThanOrEqualTo: trailingAnchor, constant: -12),
                catImageView.topAnchor.constraint(greaterThanOrEqualTo: catSaysLabel.bottomAnchor, constant: 12),
                catImageView.bottomAnchor.constraint(lessThanOrEqualTo: bottomAnchor, constant: -12)
            ])
        }
    }
}

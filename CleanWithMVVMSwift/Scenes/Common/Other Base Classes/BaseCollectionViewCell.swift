//
//  BaseCollectionViewCell.swift
//  CleanWithMVVMSwift
//
//  Created by Amais Sheikh on 03/04/2022.
//

import UIKit

class BaseCollectionViewCell: UICollectionViewCell
{
    static var identifier: String
    { return String(describing: self) }
    
    override init(frame: CGRect)
    {
        super.init(frame: frame)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureUI()
    { }
}

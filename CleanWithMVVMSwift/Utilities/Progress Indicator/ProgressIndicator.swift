//
//  ProgressIndicator.swift
//  CleanWithMVVMSwift
//
//  Created by Amais Sheikh on 04/04/2022.
//

import UIKit

class ProgressIndicator
{
    static let shared = ProgressIndicator()
    private init() {}
    
    func showActivityIndicator(inView: UIView)
    {
        inView.isUserInteractionEnabled = false
        
        let indicator = IndicatorView()
        indicator.translatesAutoresizingMaskIntoConstraints = false
        
        inView.addSubview(indicator)
        
        NSLayoutConstraint.activate([
            indicator.centerXAnchor.constraint(equalTo: inView.centerXAnchor),
            indicator.centerYAnchor.constraint(equalTo: inView.centerYAnchor)
        ])
    }
    
    func hideActivityIndicator(fromView: UIView)
    {
        for view in fromView.subviews
        {
            if view.isKind(of: IndicatorView.self)
            {
                view.removeFromSuperview()
                break
            }
        }
        
        fromView.isUserInteractionEnabled = true
    }
}

fileprivate class IndicatorView: UIView
{
    //------------------------------------------------------------
    //MARK:- Variables
    //------------------------------------------------------------
    
    private var indicatorView: UIActivityIndicatorView =
        {
            let obj = UIActivityIndicatorView(style: .large)
            obj.translatesAutoresizingMaskIntoConstraints = false
            obj.startAnimating()
            return obj
        }()
    
    //------------------------------------------------------------
    //MARK:- Initializers
    //------------------------------------------------------------
    
    init()
    {
        super.init(frame: .zero)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //------------------------------------------------------------
    //MARK:- Configure UI Methods
    //------------------------------------------------------------
    
    private func configureUI()
    {
        backgroundColor = .black.withAlphaComponent(0.7)
        layer.cornerRadius = 12
        
        addSubview(indicatorView)
        
        NSLayoutConstraint.activate([
            
            indicatorView.leadingAnchor.constraint(equalTo: leadingAnchor),
            indicatorView.trailingAnchor.constraint(equalTo: trailingAnchor),
            indicatorView.topAnchor.constraint(equalTo: topAnchor),
            indicatorView.bottomAnchor.constraint(equalTo: bottomAnchor),
            indicatorView.heightAnchor.constraint(equalToConstant: 72),
            indicatorView.widthAnchor.constraint(equalToConstant: 72)
        ])
    }
}

//
//  VerticalScrollViewBaseViewController.swift
//  CleanWithMVVMSwift
//
//  Created by Amais Sheikh on 03/04/2022.
//

import UIKit

class VerticalScrollViewBaseViewController: BaseViewController
{
    //---------------------------------------------------------------------------------------------------------
    //MARK:- Data memebers
    //---------------------------------------------------------------------------------------------------------
    
    private var scrollView: UIScrollView =
        {
            let obj = UIScrollView()
            obj.translatesAutoresizingMaskIntoConstraints = false
            return obj
        }()
    
    var scrollContainerView: UIView =
        {
            let obj = UIView()
            obj.translatesAutoresizingMaskIntoConstraints = false
            obj.backgroundColor = .gray
            return obj
        }()
    
    //---------------------------------------------------------------------------------------------------------
    //MARK:- Init
    //---------------------------------------------------------------------------------------------------------
    
    override init()
    {
        super.init()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //----------------------------------------------------------------------------------
    //MARK:- Public Interaction
    //----------------------------------------------------------------------------------
    
    //while invoking this method, make sure the anchor provided is directly inside of 'view' of ViewController
    public func configureScrollViewAnchors(scrollViewTopAnchor: NSLayoutYAxisAnchor? = nil,
                                           scrollViewBottomAnchor: NSLayoutYAxisAnchor? = nil,
                                           scrollViewLeadingAnchor: NSLayoutXAxisAnchor? = nil,
                                           scrollViewTrailingAnchor: NSLayoutXAxisAnchor? = nil)
    {
        if let topAnchor = scrollViewTopAnchor
        { configureScrollView(topAnchor: topAnchor) }
        
        if let bottomAnchor = scrollViewBottomAnchor
        { configureScrollView(bottomAnchor: bottomAnchor) }
        
        if let leadingAnchor = scrollViewLeadingAnchor
        { configureScrollView(leadingAnchor: leadingAnchor) }
        
        if let trailingAnchor = scrollViewTrailingAnchor
        { configureScrollView(trailingAnchor: trailingAnchor) }
    }
    
    //---------------------------------------------------------------------------------------------------------
    //MARK:- Configure UI
    //---------------------------------------------------------------------------------------------------------
    
    override func configureUI()
    {
        super.configureUI()
        
        //properties
        //subviews
        view.addSubview(scrollView)
        scrollView.addSubview(scrollContainerView)
        
        //constraints
        let scrollFrameGuide = scrollView.frameLayoutGuide
        let scrollContentGuide = scrollView.contentLayoutGuide
        
        NSLayoutConstraint.activate([
            
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            scrollContainerView.leadingAnchor.constraint(equalTo: scrollContentGuide.leadingAnchor),
            scrollContainerView.trailingAnchor.constraint(equalTo: scrollContentGuide.trailingAnchor),
            scrollContainerView.topAnchor.constraint(equalTo: scrollContentGuide.topAnchor),
            scrollContainerView.bottomAnchor.constraint(equalTo: scrollContentGuide.bottomAnchor),
            
            scrollContainerView.leadingAnchor.constraint(equalTo: scrollFrameGuide.leadingAnchor),
            scrollContainerView.trailingAnchor.constraint(equalTo: scrollFrameGuide.trailingAnchor)
        ])
    }
    
    private func configureScrollView(topAnchor: NSLayoutYAxisAnchor)
    {
        deactivateScrollViewConstraint(withAttribute: .top)
        scrollView.topAnchor.constraint(equalTo: topAnchor).isActive = true
    }
    
    private func configureScrollView(bottomAnchor: NSLayoutYAxisAnchor)
    {
        deactivateScrollViewConstraint(withAttribute: .bottom)
        scrollView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }
    
    private func configureScrollView(leadingAnchor: NSLayoutXAxisAnchor)
    {
        deactivateScrollViewConstraint(withAttribute: .leading)
        scrollView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
    }
    
    private func configureScrollView(trailingAnchor: NSLayoutXAxisAnchor)
    {
        deactivateScrollViewConstraint(withAttribute: .trailing)
        scrollView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
    }
    
    //---------------------------------------------------------------------------------------------------------
    //MARK:- Functionality
    //---------------------------------------------------------------------------------------------------------
    
    private func deactivateScrollViewConstraint(withAttribute: NSLayoutConstraint.Attribute)
    {
        for constraint in view.constraints
        {
            if constraint.firstItem === scrollView,
               constraint.firstAttribute == withAttribute
            {
                constraint.isActive = false
                break
            }
        }
    }
    
    //---------------------------------------------------------------------------------------------------------
    //MARK:- @objc methods
    //---------------------------------------------------------------------------------------------------------
}

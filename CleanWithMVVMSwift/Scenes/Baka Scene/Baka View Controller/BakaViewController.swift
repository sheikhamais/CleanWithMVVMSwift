//
//  BakaViewController.swift
//  CleanWithMVVMSwift
//
//  Created by Amais Sheikh on 08/04/2022.
//

import UIKit

class BakaViewController: BaseViewController
{
    //---------------------------------------------------------------------------------------------------------
    //MARK:- Data memebers
    //---------------------------------------------------------------------------------------------------------
    
    var content: BakaViewControllerUI =
        {
            let obj = BakaViewControllerUI()
            obj.translatesAutoresizingMaskIntoConstraints = false
            return obj
        }()
    
    var viewModel: BakaViewModel?
    
    //----------------------------------------------------------------------------------
    //MARK:- SectionName
    //----------------------------------------------------------------------------------
    
    override init()
    {
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
        getBakaImageUrl()
    }
    
    //---------------------------------------------------------------------------------------------------------
    //MARK:- Configure UI
    //---------------------------------------------------------------------------------------------------------
    
    override func configureUI()
    {
        //properties
        view.backgroundColor = .cream
        
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
    
    override func configurator()
    {
        let viewModel = BakaViewModel()
        self.viewModel = viewModel
    }
    
    private func getBakaImageUrl()
    {
        showIndicator()
        viewModel?.getBakaImageUrl
        { [unowned self] result in
            
            hideIndicator()
            switch result
            {
            case .failure(let error):
                self.showErrorAlert(withMessage: error.localizedDescription)
                
            case .success(let state):
                self.renderer(state: state)
            }
        }
    }
    
    //---------------------------------------------------------------------------------------------------------
    //MARK:- @objc methods
    //---------------------------------------------------------------------------------------------------------
}

//----------------------------------------------------------------------------------
//MARK:- SectionName
//----------------------------------------------------------------------------------

extension BakaViewController
{
    private func renderer(state: BakaViewModelState)
    {
        switch state
        {
        case .bakaImageUrl(let url):
            
            content.bakaImageView.loadImageFrom(url: url)
//            guard let url = URL(string: url) else { return }
//            guard let data = try? Data(contentsOf: url) else { return }
//
//            let image = UIImage(data: data)
//
//            DispatchQueue.main.async {
//                self.content.bakaImageView.image = image
//            }
            
            print("From function: \(#function) => the url is \(url)")
        }
    }
}

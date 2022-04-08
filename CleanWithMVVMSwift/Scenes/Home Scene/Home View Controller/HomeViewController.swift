//
//  HomeViewController.swift
//  CleanWithMVVMSwift
//
//  Created by Amais Sheikh on 03/04/2022.
//

import UIKit

class HomeViewController: BaseViewController
{
    //---------------------------------------------------------------------------------------------------------
    //MARK:- Data memebers
    //---------------------------------------------------------------------------------------------------------
    
    var content: HomeViewControllerUI =
        {
            let obj = HomeViewControllerUI()
            obj.translatesAutoresizingMaskIntoConstraints = false
            return obj
        }()
    
    //dependencies
    var actions: [String] //["Poke", "Peek a Boo", "Baka", "8 Ball", "Dice", "Bowy"]
    
    //configurators
    var viewModel: HomeViewModel?
    var router: HomeRouterProtocol?
    
    //----------------------------------------------------------------------------------
    //MARK:- Init
    //----------------------------------------------------------------------------------
    
    init(homeActionsList: [String] = ["Poke", "Peek a Boo", "Baka", "8 Ball", "Dice", "Bowy"])
    {
        self.actions = homeActionsList
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
        
        content.actionsCollectionView.delegate = self
        content.actionsCollectionView.dataSource = self
        content.actionsCollectionView.register(ActionsCollectionViewCell.self,
                                               forCellWithReuseIdentifier: ActionsCollectionViewCell.identifier)
        
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
        let viewModel = HomeViewModel()
        let router = HomeRouter()
        
        self.viewModel = viewModel
        router.viewController = self
        self.router = router
    }
    
    func didTapAction(at indexPath: IndexPath)
    {
        let action = actions[indexPath.item]
        
        switch action
        {
        case "Poke":
            pokeTheCat()
            
        case "Peek a Boo":
            break
        case "Baka":
            goForBaka()
            
        case "8 Ball":
            break
        case "Dice":
            break
        case "Bowy":
            askTheBoy()
            
        default:
            print("From function: \(#function) => handle default action case")
        }
    }
    
    private func pokeTheCat()
    {
        showIndicator()
        viewModel?.pokeTheCat
        { [unowned self] result in
            
            self.hideIndicator()
            switch result
            {
            case .failure(let error):
                showErrorAlert(withMessage: error.localizedDescription)
            case .success(let state):
                self.viewModelStateRendering(state: state)
            }
        }
    }
    
    private func askTheBoy()
    {
        showIndicator()
        viewModel?.whatBoySay
        { [unowned self] result in
            
            self.hideIndicator()
            switch result
            {
            case .failure(let error):
                showErrorAlert(withMessage: error.localizedDescription)
            case .success(let state):
                self.viewModelStateRendering(state: state)
            }
        }
    }
    
    private func goForBaka()
    {
        router?.routeToBaka()
    }
    
    //---------------------------------------------------------------------------------------------------------
    //MARK:- @objc methods
    //---------------------------------------------------------------------------------------------------------
}

//----------------------------------------------------------------------------------
//MARK:- Collection View Methods
//----------------------------------------------------------------------------------

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout
{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        return actions.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ActionsCollectionViewCell.identifier,
                                                      for: indexPath) as! ActionsCollectionViewCell
        
        cell.actionTitleLabel.text = actions[indexPath.item]
        if indexPath.item == 0 || indexPath.item == 2 || indexPath.item == 5
        {
            cell.containerView.layer.borderWidth = 3
            cell.containerView.layer.borderColor = UIColor.black.cgColor
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
    {
        let width = view.frame.width / 2
        return CGSize(width: width, height: 120)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath)
    { didTapAction(at: indexPath) }
}

//----------------------------------------------------------------------------------
//MARK:- View Model State Rendering
//----------------------------------------------------------------------------------

extension HomeViewController
{
    func viewModelStateRendering(state: HomeViewModelState)
    {
        switch state
        {
        case .pokedCatSays(let catSays):
            DispatchQueue.main.async
            { self.router?.routeToPokeViewController(catSaid: catSays) }
            
        case .boySaid(let boySaid):
            DispatchQueue.main.async
            { self.showSingleButtonAlert(withTitle: "I Say", withMessage: boySaid) }
        }
    }
}

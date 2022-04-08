//
//  HomeViewModel.swift
//  CleanWithMVVMSwift
//
//  Created by Amais Sheikh on 03/04/2022.
//

import Foundation

enum HomeViewModelState
{
    case pokedCatSays(String)
    case boySaid(String)
}

class HomeViewModel
{
    //------------------------------------------------------------
    //MARK:- Variables
    //------------------------------------------------------------
    
    typealias HomeViewModelStateCompletion = (Result<HomeViewModelState, Error>) -> Void
    
    private var imagingWorker: ImagingWorker
    private var textDataWorker: TextDataWorker
    
    //------------------------------------------------------------
    //MARK:- Initializers
    //------------------------------------------------------------
    
    init(imagingWorker: ImagingWorker = ImagingWorker(),
         textDataWorker: TextDataWorker = TextDataWorker())
    {
        self.imagingWorker = imagingWorker
        self.textDataWorker = textDataWorker
    }
    
    //------------------------------------------------------------
    //MARK:- Functionality
    //------------------------------------------------------------
    
    public func pokeTheCat(completion: @escaping HomeViewModelStateCompletion)
    {
        textDataWorker.pokeCat
        { result in
            
            switch result
            {
            case .failure(let error):
                completion(.failure(error))
                
            case .success(let catPingResponseModel):
                let catResponse = catPingResponseModel.catboy_says ?? "???"
                completion(.success(.pokedCatSays(catResponse)))
            }
        }
    }
    
    public func whatBoySay(completion: @escaping HomeViewModelStateCompletion)
    {
        textDataWorker.whatBoySay
        { result in
            switch result
            {
            case .failure(let error):
                completion(.failure(error))
                
            case .success(let whatBoySaysResponseModel):
                let boyResponse = whatBoySaysResponseModel.response ?? "???"
                completion(.success(.boySaid(boyResponse)))
            }
        }
    }
}

//
//  TextDataWorker.swift
//  CleanWithMVVMSwift
//
//  Created by Amais Sheikh on 03/04/2022.
//

import Foundation

class TextDataWorker
{
    //----------------------------------------------------------------------------------
    //MARK:- SectionName
    //----------------------------------------------------------------------------------
    
    private lazy var homeRepositoryInteraction: HomeRepositoryInteraction =
        {
            return HomeRepository()
        }()
    
    //----------------------------------------------------------------------------------
    //MARK:- SectionName
    //----------------------------------------------------------------------------------
    
    public func pokeCat(completion: @escaping (Result<CatBoyPingResponseModel, Error>) -> Void)
    {
        homeRepositoryInteraction.pokeTheCat
        { result in
            //any addition processing on data response can be done here e.g filtering, sorting, mapping into custom usable models
            completion(result)
        }
    }
    
    public func whatBoySay(completion: @escaping (Result<WhatBoySayResponseModel, Error>) -> Void)
    {
        homeRepositoryInteraction.whatBoySaid
        { result in
            //any addition processing on data response can be done here e.g filtering, sorting, mapping into custom usable models
            completion(result)
        }
    }
}

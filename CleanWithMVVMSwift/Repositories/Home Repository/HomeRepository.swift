//
//  HomeRepository.swift
//  CleanWithMVVMSwift
//
//  Created by Amais Sheikh on 05/04/2022.
//

import Foundation

protocol HomeRepositoryInteraction
{
    func pokeTheCat(completion: @escaping (Result<CatBoyPingResponseModel, Error>) -> Void)
    func whatBoySaid(completion: @escaping (Result<WhatBoySayResponseModel, Error>) -> Void)
}

class HomeRepository: HomeRepositoryInteraction
{
    let apiManagerInteraction = ApiManager.shared
    
    func pokeTheCat(completion: @escaping (Result<CatBoyPingResponseModel, Error>) -> Void)
    {
        let url = CatUrls.pingUrl
        apiManagerInteraction.getApiRequest(url: url)
        { data, response, error in
            
            if let error = error
            {
                completion(.failure(error))
                return
            }
            
            guard let data = data
            else
            {
                completion(.failure(NetworkError.dataNotFound))
                return
            }
            
            guard let encodedModel = data.decode(into: CatBoyPingResponseModel.self)
            else
            {
                completion(.failure(NetworkError.decodingError))
                return
            }
            
            guard encodedModel.error == "none"
            else
            {
                completion(.failure(NetworkError.invalidResponse))
                return
            }
            
            completion(.success(encodedModel))
        }
    }
    
    func whatBoySaid(completion: @escaping (Result<WhatBoySayResponseModel, Error>) -> Void)
    {
        let url = CatUrls.catboyUrl
        apiManagerInteraction.getApiRequest(url: url)
        { data, response, error in
            
            if let error = error
            {
                completion(.failure(error))
                return
            }
            
            guard let data = data
            else
            {
                completion(.failure(NetworkError.dataNotFound))
                return
            }
            
            guard let encodedModel = data.decode(into: WhatBoySayResponseModel.self)
            else
            {
                completion(.failure(NetworkError.decodingError))
                return
            }
            
            guard encodedModel.error == "none"
            else
            {
                completion(.failure(NetworkError.invalidResponse))
                return
            }
            
            completion(.success(encodedModel))
        }
    }
}

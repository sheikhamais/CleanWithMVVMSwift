//
//  BakaRepository.swift
//  CleanWithMVVMSwift
//
//  Created by Amais Sheikh on 08/04/2022.
//

import Foundation

protocol BakaRepositoryInteraction
{
    func getBakaImageUrl(completion: @escaping (Result<BakaImageUrlResponseModel, Error>) -> Void)
}

class BakaRepository: BakaRepositoryInteraction
{
    let apiManagerInteraction = ApiManager.shared
    
    //----------------------------------------------------------------------------------
    //MARK:- SectionName
    //----------------------------------------------------------------------------------
    
    func getBakaImageUrl(completion: @escaping (Result<BakaImageUrlResponseModel, Error>) -> Void)
    {
        let url = CatUrls.bakaUrl
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
                completion(.failure(CatError.dataNotFound))
                return
            }
            
            guard let encodedModel = data.decode(into: BakaImageUrlResponseModel.self)
            else
            {
                completion(.failure(CatError.decodingError))
                return
            }
            
            guard encodedModel.error == "none"
            else
            {
                completion(.failure(CatError.invalidResponse))
                return
            }
            
            completion(.success(encodedModel))
        }
    }
}

//
//  ImagingWorker.swift
//  CleanWithMVVMSwift
//
//  Created by Amais Sheikh on 03/04/2022.
//

import Foundation

class ImagingWorker
{
    //----------------------------------------------------------------------------------
    //MARK:- SectionName
    //----------------------------------------------------------------------------------
    
    private lazy var bakaRepositoryInteraction: BakaRepositoryInteraction =
        {
            return BakaRepository()
        }()
    
    //----------------------------------------------------------------------------------
    //MARK:- SectionName
    //----------------------------------------------------------------------------------
    
    func getBakaImage(completion: @escaping (Result<BakaImageUrlResponseModel, Error>) -> Void)
    {
        bakaRepositoryInteraction.getBakaImageUrl
        { result in
            //any addition processing on data response can be done here e.g filtering, sorting, mapping into custom usable models
            completion(result)
        }
    }
}

//
//  BakaViewModel.swift
//  CleanWithMVVMSwift
//
//  Created by Amais Sheikh on 08/04/2022.
//

import Foundation

enum BakaViewModelState
{
    case bakaImageUrl(String)
}

class BakaViewModel
{
    typealias BakaViewModelHandler = (Result<BakaViewModelState, Error>) -> Void
    
    private var imagingWorker: ImagingWorker
    
    //----------------------------------------------------------------------------------
    //MARK:- SectionName
    //----------------------------------------------------------------------------------
    
    init(imagingWorker: ImagingWorker = ImagingWorker())
    {
        self.imagingWorker = imagingWorker
    }
    
    //----------------------------------------------------------------------------------
    //MARK:- SectionName
    //----------------------------------------------------------------------------------
    
    func getBakaImageUrl(completion: @escaping BakaViewModelHandler)
    {
        imagingWorker.getBakaImage
        { result in
            
            switch result
            {
            case .failure(let error):
                completion(.failure(error))
                
            case .success(let bakaUrlResponseModel):
                let url = bakaUrlResponseModel.url ?? "???"
                completion(.success(.bakaImageUrl(url)))
            }
        }
    }
}

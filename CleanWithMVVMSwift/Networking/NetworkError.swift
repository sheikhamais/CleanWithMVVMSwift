//
//  CatError.swift
//  CleanWithMVVMSwift
//
//  Created by Amais Sheikh on 07/04/2022.
//

import Foundation

enum NetworkError: LocalizedError
{
    case dataNotFound
    case decodingError
    case encodingError
    case invalidResponse
}

extension NetworkError
{
    var errorDescription: String?
    {
        get
        {
            switch self
            {
            case .dataNotFound:
                return "Data not found"
                
            case .decodingError:
                return "Unable to decode data"
                
            case .encodingError:
                return "Unable to encode data"
                
            case .invalidResponse:
                return "Invalid reponse from server"
            }
        }
    }
}

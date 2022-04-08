//
//  Codable.swift
//  CleanWithMVVMSwift
//
//  Created by Amais Sheikh on 07/04/2022.
//

import Foundation

extension Data
{
    func decode<T: Decodable>(into: T.Type) -> T?
    {
        let decoder = JSONDecoder()
        let model = try? decoder.decode(T.self, from: self)
        return model
    }
    
    func encode<T: Encodable>(from model: T) -> Data?
    {
        let encoder = JSONEncoder()
        let data = try? encoder.encode(model)
        return data
    }
}

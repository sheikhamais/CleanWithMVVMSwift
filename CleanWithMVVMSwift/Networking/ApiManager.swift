//
//  ApiManager.swift
//  CleanWithMVVMSwift
//
//  Created by Amais Sheikh on 05/04/2022.
//

import Foundation

enum HttpMethod: String
{
    case GET
    case POST
}

protocol ApiManagerInteraction
{
    func makeRequest(url: String, httpMethod: HttpMethod, body: [String: Any]?, completion: @escaping ApiResponseHandler)
    func getApiRequest(url: String, completion: @escaping ApiResponseHandler)
    func postApiRequest(url: String, body: [String: Any], completion: @escaping ApiResponseHandler)
}

class ApiManager
{
    //------------------------------------------------------------
    //MARK:- Variables
    //------------------------------------------------------------
    
    static let shared: ApiManagerInteraction = ApiManager()
    private init() {}
    
    private let sharedSession = URLSession.shared
    
    //------------------------------------------------------------
    //MARK:- Functionality
    //------------------------------------------------------------
    
    //try taking body of codable type protocol here
    private func getData(url: String, httpMethod: HttpMethod, body: [String: Any]? = nil, completion: @escaping ApiResponseHandler)
    {
        guard let url = URL(string: url)
        else
        {
            return
        }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = httpMethod.rawValue
        if let body = body
        { urlRequest.httpBody = getDataForHttpbody(body: body) }
        
        let task = sharedSession.dataTask(with: urlRequest)
        { data, response, error in
            
            completion(data, response, error)
        }
        
        task.resume()
    }
    
    private func getDataForHttpbody(body: [String: Any]) -> Data?
    {
        let data = try? JSONSerialization.data(withJSONObject: body)
        return data
    }
}

//----------------------------------------------------------------------------------
//MARK:- Public functionality
//----------------------------------------------------------------------------------

extension ApiManager: ApiManagerInteraction
{
    func makeRequest(url: String, httpMethod: HttpMethod, body: [String : Any]? = nil, completion: @escaping ApiResponseHandler)
    { getData(url: url, httpMethod: httpMethod, body: body, completion: completion) }
    
    func getApiRequest(url: String, completion: @escaping ApiResponseHandler)
    { getData(url: url, httpMethod: .GET, completion: completion) }
    
    func postApiRequest(url: String, body: [String: Any], completion: @escaping ApiResponseHandler)
    { getData(url: url, httpMethod: .POST, body: body, completion: completion) }
}

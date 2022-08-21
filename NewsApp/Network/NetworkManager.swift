//
//  NetworkManager.swift
//  NewsApp
//
//  Created by Uresha Lakshani on 2022-08-21.
//

import Foundation
import UIKit

class NetworkManager{

    public static let shared  = NetworkManager()
    private let session = URLSession.shared
    private let baseURL = "https://newsapi.org/v2"
    private let apiKey = "60649f16e4c843c9bb43c0b83d6b55ea"

    private init(){}
    
    //network function
    func getNews<T: Codable>(generalType: T.Type, parameters: [String: String], endPont: EndPoint, completion: @escaping (Result<T, RequestError>) -> Void) {
        
        // check URL
        guard var urlComponents = URLComponents(string: baseURL + endPont.rawValue) else {
            completion(.failure(.invalidateURL))
            return
        }

        //Add URL Parameters
        urlComponents.queryItems = parameters.map { (key, value) in
                URLQueryItem(name: key, value: value)
            }
        
        //ADD API Key
        let urlWithComponents = urlComponents.url!.appending("apiKey", value: apiKey)

        //Request & Decode
        let dataTask = session.dataTask(with: urlWithComponents) { data, response, error in

            guard let resposeData = data else{
                completion(.failure(.noDataAvalalible))
                return
            }

            do{
                /// get NewsResponse data after decode from json to NewsResponse object
                /// Return :   NewsResponse object
                let decoder = JSONDecoder()
                let response = try decoder.decode(T.self,
                                                        from : resposeData)
                completion(.success(response))
                
            }catch {
                completion(.failure(.canNotProcessData))
            }
        }
        
        //Resumes the task
        dataTask.resume()
    }
}

enum EndPoint: String{
    case topHeadLines = "/top-headlines"
    case everything = "/everything"
}

//
//  MoviesService.swift
//  TopFilmes
//
//  Created by Kleyton Prestes Stringhetta on 18/10/19.
//  Copyright © 2019 Breno Carvalho de Morais. All rights reserved.
//

import Alamofire
import AlamofireObjectMapper
import Foundation

class MoviesService {
    
    func getTopMovies(page: Int, completionHandler: @escaping (DataResponse<MovieResponse>) -> Void) {
        DispatchQueue.main.async {
            let requestUrl: String = "\(APIManager.baseUrl)popular?api_key=\(APIManager.key)&language=pt-BR&page=\(page)"
            guard let url = URL(string: requestUrl) else { return }
            Alamofire.request(url).responseObject { (response: DataResponse<MovieResponse>) in
                completionHandler(response)
            }
        }
    }
    
//    func getMoviesImage(page: Int, completionHandler: @escaping (DataResponse<UIImage>) -> Void) {
//        DispatchQueue.main.async {
//            let requestUrl: String = "\(APIManager.baseUrl)popular?api_key=\(APIManager.key)&language=pt-BR&page=\(page)"
//            guard let url = URL(string: requestUrl) else { return }
//            Alamofire.request(url).responseObject { (response: DataResponse<MovieResponse>) in
//                completionHandler(response)
//            }
//        }
//    }
}

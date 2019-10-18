//
//  MovieDetails.swift
//  TopFilmes
//
//  Created by Kleyton Prestes Stringhetta on 18/10/19.
//  Copyright © 2019 Breno Carvalho de Morais. All rights reserved.
//

import Foundation
import ObjectMapper

class MovieDetails: Mappable {
    var id: Int?
//    var original_title: String?
//    var original_language: String?
//    var title: String?
//    var backdrop_path: String?
//    var popularity: NSNumber?
//    var vote_count: NSNumber?
//    var video: Bool?
//    var vote_average: NSNumber?
    
    func mapping(map: Map) {
        id <- map["id"]
//        original_title <- map["original_title"]
//        original_language <- map["original_language"]
//        title <- map["title"]
//        backdrop_path <- map["backdrop_path"]
//        popularity <- map["backdrop_path"]
//        vote_count <- map["backdrop_path"]
//        video <- map["video"]
//        vote_average <- map["vote_count"]
    }
    
    required init?(map: Map){
        
    }
}

//
//  MovieDetailsViewModel.swift
//  TopFilmes
//
//  Created by Breno Carvalho de Morais on 18/10/19.
//  Copyright © 2019 Breno Carvalho de Morais. All rights reserved.
//

import Foundation

protocol MovieDetailsProtocol {
    func didLoadMovieDetails(details: MovieDetails)
    func didFailedLoadMovieDetails()
}

class MovieDetailsViewModel {
    var delegate: MovieDetailsProtocol
    private let service = MoviesService()
    
    init(delegate: MovieDetailsProtocol) {
        self.delegate = delegate
    }
    
    public func loadMovieDetails(movieId: Int) {
        service.getMovieDetails(movieId: movieId) { (response) in
            if response.error != nil {
                self.delegate.didFailedLoadMovieDetails()
                
            } else {
                if let details = response.result.value {
                    self.delegate.didLoadMovieDetails(details: details)
                }
            }
        }
    }
    
    func saveToFavorites() {
        
    }
    
    func removeToFavorites() {
        
    }
}

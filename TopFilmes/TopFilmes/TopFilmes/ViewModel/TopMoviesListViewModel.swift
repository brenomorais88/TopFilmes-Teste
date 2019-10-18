//
//  TopMoviesListViewModel.swift
//  TopFilmes
//
//  Created by Kleyton Prestes Stringhetta on 17/10/19.
//  Copyright © 2019 Breno Carvalho de Morais. All rights reserved.
//

import Foundation

protocol TopMoviesListProtocol {
    func didLoadMovies(movies: [Movie])
    func didFailedLoadMovies()
}

class TopMoviesListViewModel {
    var delegate: TopMoviesListProtocol
    private let service = MoviesService()
    
    init(delegate: TopMoviesListProtocol) {
        self.delegate = delegate
    }
    
    public func loadTopMovies(page: Int) {
        service.getTopMovies(page: page) { (response) in
            if response.error != nil {
                self.delegate.didFailedLoadMovies()
            
            } else {
                let movies = response.result.value?.results
                self.delegate.didLoadMovies(movies: movies ?? [])
            }
        }
    }
}

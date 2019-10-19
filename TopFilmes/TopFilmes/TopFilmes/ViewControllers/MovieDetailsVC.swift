//
//  MovieDetailsVC.swift
//  TopFilmes
//
//  Created by Breno Carvalho de Morais on 18/10/19.
//  Copyright © 2019 Breno Carvalho de Morais. All rights reserved.
//

import UIKit

class MovieDetailsVC: UIViewController {
    @IBOutlet weak var movieImage: UIImageView!
    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var movieRate: UILabel!
    @IBOutlet weak var movieDate: UILabel!
    @IBOutlet weak var movieDescription: UITextView!
    @IBOutlet weak var favoriteBtn: UIButton!
    @IBOutlet weak var movieView: UIView!
    @IBOutlet weak var loading: UIActivityIndicatorView!
    
    var movieDetailsViewModel: MovieDetailsViewModel?
    var movie: Movie?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Detalhes do filme"
        setupViewState(state: .loading)
        movieDetailsViewModel = MovieDetailsViewModel(delegate: self)
        if let id = self.movie?.id {
            self.movieDetailsViewModel?.loadMovieDetails(movieId: id)
        }
    }
    
    private func setupViewState(state: ViewState) {
        self.movieView.isHidden = true
        self.loading.isHidden = true
        
        switch state {
        case .loading:
            self.loading.isHidden = false
            self.loading.startAnimating()
            
        case .showing:
            self.movieView.isHidden = false
            
        default:
            break
        }
    }
    
    @IBAction func favoriteMovie(_ sender: Any) {
    }
    
}

extension MovieDetailsVC: MovieDetailsProtocol {
    func didLoadMovieDetails(details: MovieDetails) {
        
        if let endpoint = details.backdrop_path {
            let baseImageUrl = "https://image.tmdb.org/t/p/w185/\(endpoint)"
            if let url = URL(string: baseImageUrl) {
                self.movieImage.downloaded(url: url)
            }
        }
        
        self.movieTitle.text = details.title
        self.movieRate.text = details.title
        self.movieDate.text = details.title
        self.movieDescription.text = details.overview
        setupViewState(state: .showing)
    }
    
    func didFailedLoadMovieDetails() {
        
    }
}

//
//  MovieCell.swift
//  TopFilmes
//
//  Created by Kleyton Prestes Stringhetta on 17/10/19.
//  Copyright © 2019 Breno Carvalho de Morais. All rights reserved.
//

import UIKit

class MovieCell: UICollectionViewCell {
    @IBOutlet weak var movieImage: UIImageView!
    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var movieAverage: UILabel!
    @IBOutlet weak var moviePopularity: UILabel!
    @IBOutlet weak var detailsView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setupCell(movie: Movie) {
        self.movieTitle.text = movie.title
        self.movieAverage.text = movie.getAverage()
        self.moviePopularity.text = movie.getPopularity()
        self.loadMovieImage(imagePath: movie.backdrop_path)
    }
    
    private func loadMovieImage(imagePath: String?) {
        guard let endPoint = imagePath else {
            return
        }
        let baseImageUrl = "https://image.tmdb.org/t/p/w185/\(endPoint)"
        if let url = URL(string: baseImageUrl) {
            movieImage.downloaded(url: url)
        }
    }
}





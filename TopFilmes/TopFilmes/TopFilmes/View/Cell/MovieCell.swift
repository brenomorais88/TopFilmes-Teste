//
//  MovieCell.swift
//  TopFilmes
//
//  Created by Breno Carvalho de Morais on 17/10/19.
//  Copyright © 2019 Breno Carvalho de Morais. All rights reserved.
//

import UIKit

class MovieCell: UICollectionViewCell {
    @IBOutlet weak var movieImage: UIImageView!
    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var movieYear: UILabel!
    @IBOutlet weak var detailsView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func prepareForReuse() {
        self.movieImage.image = UIImage(named: "placeholder")
        self.movieTitle.text = ""
        self.movieYear.text = ""
        super.prepareForReuse()
    }
    
    func setupCell(movie: Movie) {
        self.movieTitle.text = movie.title
        self.movieYear.text = movie.release_date
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





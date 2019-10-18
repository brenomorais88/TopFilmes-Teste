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
    @IBOutlet weak var loading: UIActivityIndicatorView!
    @IBOutlet weak var detailsView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setupCell(movie: Movie) {
        self.loading.isHidden = true
        self.loading.stopAnimating()
        self.movieTitle.text = movie.title
    }
    
    func setupLoadingCell() {
        self.loading.isHidden = false
        self.loading.startAnimating()
        self.detailsView.isHidden = true
    }
}





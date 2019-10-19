//
//  TopMoviesListVC.swift
//  TopFilmes
//
//  Created by Breno Carvalho de Morais on 17/10/19.
//  Copyright © 2019 Breno Carvalho de Morais. All rights reserved.
//

import UIKit

class TopMoviesListVC: UIViewController {
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var loading: UIActivityIndicatorView!
    @IBOutlet weak var emptyLabel: UILabel!
    var topMoviesListViewModel: TopMoviesListViewModel?
    private var page: Int = 1
    
     var movies: [Movie] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Top Filmes"
        setupViewState(state: .loading)
        self.topMoviesListViewModel = TopMoviesListViewModel(delegate: self)
        self.topMoviesListViewModel?.loadTopMovies(page: page)
        setupCollectionView()
    }
    
    private func setupViewState(state: ViewState) {
        self.collectionView.isHidden = true
        self.loading.isHidden = true
        self.emptyLabel.isHidden = true
        
        switch state {
        case .loading:
            self.loading.isHidden = false
            self.loading.startAnimating()
            
        case .showing:
            self.collectionView.isHidden = false
            
        case .empty:
            self.emptyLabel.isHidden = false
            self.emptyLabel.text = "Nenhum resultado encontrado"
            
        case .error:
            self.emptyLabel.text = "Erro ao processar sua solicitação"
            self.emptyLabel.isHidden = false
            
        }
    }
    
    private func setupCollectionView() {
        collectionView.register(UINib(nibName: "MovieCell", bundle: nil),
                                forCellWithReuseIdentifier: "MovieCell")
        collectionView.delegate = self
        collectionView.dataSource = self
        self.layoutCells()
    }
    
    private func layoutCells() {
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layout.minimumInteritemSpacing = 0.0
        layout.minimumLineSpacing = 0.0
        
        let width: CGFloat = (UIScreen.main.bounds.width - 16) / 3
        let height: CGFloat = 290
        
        layout.itemSize = CGSize(width: width,
                                 height: height)
        collectionView.collectionViewLayout = layout
        collectionView.reloadData()
    }
    
    @IBAction func showFilterView(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "MoviesFilterVC") as! MoviesFilterVC
        vc.delegate = self
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}

extension TopMoviesListVC: TopMoviesListProtocol {
    func didLoadMovies(movies: [Movie]) {
        if movies.count > 0 {
            self.movies.append(contentsOf: movies)
            self.collectionView.reloadData()
            setupViewState(state: .showing)
        } else {
            setupViewState(state: .empty)
        }
    }
    
    func didFailedLoadMovies() {
        setupViewState(state: .error)
    }
}

extension TopMoviesListVC: MoviesFilterProtocol {
    func filterMovies(filter: MoviesFilter) {
        self.setupViewState(state: .loading)
        self.movies = []
        
    }
}

extension TopMoviesListVC: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.movies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let movie = self.movies[indexPath.row]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MovieCell", for: indexPath) as! MovieCell
        cell.setupCell(movie: movie)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if indexPath.row == self.movies.count - 1 {
            page += 1
            print("carrega mais filmes")
            self.topMoviesListViewModel?.loadTopMovies(page: page)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let movie = self.movies[indexPath.row]
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "MovieDetailsVC") as! MovieDetailsVC
        vc.movie = movie
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

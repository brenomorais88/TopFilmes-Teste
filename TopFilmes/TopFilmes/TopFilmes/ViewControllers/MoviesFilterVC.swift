//
//  MoviesFilterViewController.swift
//  TopFilmes
//
//  Created by Kleyton Prestes Stringhetta on 18/10/19.
//  Copyright © 2019 Breno Carvalho de Morais. All rights reserved.
//

import UIKit

struct MoviesFilter {
    let text: String
    let year: String
    let isAdult: Bool
}

protocol MoviesFilterProtocol {
    func filterMovies(filter: MoviesFilter)
}

class MoviesFilterVC: UIViewController {

    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var yearTextField: UITextField!
    @IBOutlet weak var adultsSwitch: UISwitch!
    
    var delegate: MoviesFilterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Filtro"
    }

    @IBAction func filter(_ sender: Any) {
        let filter = MoviesFilter(text: self.titleTextField.text ?? "",
                                  year: self.titleTextField.text ?? "",
                                  isAdult: self.adultsSwitch.isOn)
        self.delegate?.filterMovies(filter: filter)
        
    }
}

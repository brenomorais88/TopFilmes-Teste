//
//  UIImageView+Extensions.swift
//  TopFilmes
//
//  Created by Breno Carvalho Alves Morais on 18/10/2019.
//  Copyright © 2019 Breno Carvalho de Morais. All rights reserved.
//

import UIKit

extension UIImageView {
    func downloaded(url: URL, contentMode: UIView.ContentMode = .scaleAspectFit) {
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
                else { return }
            DispatchQueue.main.async() {
                self.image = image
            }
            }.resume()
    }
}

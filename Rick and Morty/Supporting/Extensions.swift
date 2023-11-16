//
//  Extensions.swift
//  Rick and Morty
//
//  Created by Мерей Булатова on 16.11.2023.
//

import UIKit

extension UIView {
    func addSubviews(_ views: UIView...) {
        views.forEach({
            addSubview($0)
        })
    }
}

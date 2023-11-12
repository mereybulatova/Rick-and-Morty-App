//
//  CharacterInfoViewController.swift
//  Rick and Morty
//
//  Created by Мерей Булатова on 13.11.2023.
//

import UIKit

class CharacterInfoViewController: UIViewController {
    
    let characterImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "")
        image.contentMode = .scaleAspectFill
        image.layer.masksToBounds = true
        image.layer.cornerRadius = 150
        image.layer.borderWidth = 5
        image.layer.borderColor = UIColor(red: 0.95, green: 0.95, blue: 0.97, alpha: 1).cgColor
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    let cameraButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "camera"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "backLogo"), style: .plain, target: nil, action: nil)
    }
}

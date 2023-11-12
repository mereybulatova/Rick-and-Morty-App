//
//  EpisodeCollectionViewCell.swift
//  Rick and Morty
//
//  Created by Мерей Булатова on 12.11.2023.
//

import UIKit

class CharacterCollectionViewCell: UICollectionViewCell {
    
    let identifier = "CharacterCell"
    
    let backView = {
        let view = UIView()
        view.backgroundColor = .systemBackground
        view.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.14).cgColor
        view.layer.shadowOpacity = 1
        view.layer.shadowRadius = 4
        view.layer.shadowOffset = CGSize(width: 0, height: 2)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let characterImage = {
        let image = UIImageView()
        image.image = UIImage(named: "characterImage")
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    let titleLabel = {
        let label = UILabel()
        label.text = "Rick Sanchez"
        label.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.87)
        label.font = .boldSystemFont(ofSize: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let grayView = {
        let view = UIView()
        view.backgroundColor = .darkGray
        return view
    }()
    
    let episodeImage = {
        let image = UIImageView()
        image.image = UIImage(named: "episodeImage")
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    let episodeLabel = {
        let label = UILabel()
        label.text = "Pilot | S01E01"
        label.font = UIFont(name: "Roboto-Regular", size: 16)
        label.textColor = UIColor(red: 0.192, green: 0.196, blue: 0.204, alpha: 1)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let favoriteButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "favoriteImage"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI() {
        contentView.addSubview(backView)
        backView.addSubview(characterImage)
        backView.addSubview(titleLabel)
        backView.addSubview(grayView)
        backView.addSubview(episodeImage)
        backView.addSubview(episodeLabel)
        backView.addSubview(favoriteButton)

        NSLayoutConstraint.activate([
            backView.topAnchor.constraint(equalTo: contentView.topAnchor),
            backView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            backView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            backView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
        
        NSLayoutConstraint.activate([
            characterImage.topAnchor.constraint(equalTo: backView.topAnchor),
            characterImage.leadingAnchor.constraint(equalTo: backView.leadingAnchor),
            characterImage.trailingAnchor.constraint(equalTo: backView.trailingAnchor),
        ])
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: characterImage.bottomAnchor, constant: 12),
            titleLabel.leadingAnchor.constraint(equalTo: backView.leadingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: backView.trailingAnchor, constant: -16)
        ])
        
        NSLayoutConstraint.activate([
            episodeImage.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 35),
            episodeImage.leadingAnchor.constraint(equalTo: backView.leadingAnchor, constant: 22),
        ])
        
        NSLayoutConstraint.activate([
            episodeLabel.centerYAnchor.constraint(equalTo: episodeImage.centerYAnchor),
            episodeLabel.leadingAnchor.constraint(equalTo: episodeImage.trailingAnchor, constant: 11)
        ])
        
        NSLayoutConstraint.activate([
            favoriteButton.centerYAnchor.constraint(equalTo: episodeImage.centerYAnchor),
            favoriteButton.trailingAnchor.constraint(equalTo: backView.trailingAnchor, constant: -18),
            favoriteButton.heightAnchor.constraint(equalToConstant: 60),
            favoriteButton.widthAnchor.constraint(equalToConstant: 60)
        ])
    }
}

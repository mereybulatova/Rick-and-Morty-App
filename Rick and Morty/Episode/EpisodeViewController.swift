//
//  ViewController.swift
//  Rick and Morty
//
//  Created by Мерей Булатова on 12.11.2023.
//

import UIKit

class EpisodeViewController: UIViewController {
    
    let logoImage = {
        let image = UIImageView()
        image.image = UIImage(named: "logo")
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    let searchUI = {
        let search = UISearchBar()
        search.placeholder = "Name or episode (ex.S01E01)..."
        search.searchTextField.font = .systemFont(ofSize: 16)
        search.searchTextField.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.5)
        search.searchTextField.backgroundColor = .systemBackground
        search.layer.cornerRadius = 8
        search.layer.borderWidth = 1.0
        search.layer.borderColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.5).cgColor
        search.translatesAutoresizingMaskIntoConstraints = false
        return search
    }()
    
    let buttonFilter = {
        let button = UIButton()
        button.setTitle("ADVANCED FILTERS", for: .normal)
        button.titleLabel?.textAlignment = .center
        button.backgroundColor = UIColor(red: 0.89, green: 0.95, blue: 0.99, alpha: 1)
        button.setTitleColor(UIColor(red: 0.13, green: 0.59, blue: 0.95, alpha: 1), for: .normal)
        button.titleLabel?.font = UIFont(name: "Roboto-Medium", size: 14)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        //MARK: - Button shadow
        button.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.24).cgColor
        button.layer.shadowOffset = CGSize(width: 0, height: 2)
        button.layer.shadowOpacity = 1
        button.layer.shadowRadius = 2
        return button
    }()
    
    let filterImage = {
        let image = UIImageView()
        image.image = UIImage(named: "filter")
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    let episodeCollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumInteritemSpacing = 55
        layout.minimumLineSpacing = 55
        layout.itemSize = CGSize(width: 347, height: 357)
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(CharacterCollectionViewCell.self, forCellWithReuseIdentifier: "CharacterCell")
        collectionView.showsVerticalScrollIndicator = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        return collectionView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        episodeCollectionView.dataSource = self
        episodeCollectionView.delegate = self
        setupUI()
    }

    func setupUI() {
        view.addSubview(logoImage)
        view.addSubview(searchUI)
        view.addSubview(buttonFilter)
        buttonFilter.addSubview(filterImage)
        view.addSubview(episodeCollectionView)
        
        NSLayoutConstraint.activate([
            logoImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 57),
            logoImage.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            searchUI.topAnchor.constraint(equalTo: logoImage.bottomAnchor, constant: 67),
            searchUI.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 23),
            searchUI.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -23),
            searchUI.heightAnchor.constraint(equalToConstant: 56)
        ])
        
        NSLayoutConstraint.activate([
            buttonFilter.topAnchor.constraint(equalTo: searchUI.bottomAnchor, constant: 12),
            buttonFilter.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 23),
            buttonFilter.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -23),
            buttonFilter.heightAnchor.constraint(equalToConstant: 56)
        ])
        
        NSLayoutConstraint.activate([
            filterImage.centerYAnchor.constraint(equalTo: buttonFilter.centerYAnchor),
            filterImage.leadingAnchor.constraint(equalTo: buttonFilter.leadingAnchor, constant: 22)
        ])
        
        NSLayoutConstraint.activate([
            episodeCollectionView.topAnchor.constraint(equalTo: buttonFilter.bottomAnchor, constant: 30),
            episodeCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -23),
            episodeCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 23),
            episodeCollectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}

extension EpisodeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CharacterCell", for: indexPath) as! CharacterCollectionViewCell
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let destinationVC = CharacterInfoViewController()
        navigationController?.pushViewController(destinationVC, animated: true)
        
        navigationItem.title = ""
        navigationController?.navigationBar.tintColor = .black
        navigationController?.navigationBar.backIndicatorImage = UIImage(named: "goBack")
        navigationController?.navigationBar.backIndicatorTransitionMaskImage = UIImage(named: "goBack")
    }
}


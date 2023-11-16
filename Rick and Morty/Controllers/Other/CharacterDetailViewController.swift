//
//  CharacterDetailViewController.swift
//  Rick and Morty
//
//  Created by Мерей Булатова on 16.11.2023.
//

import UIKit

final class CharacterDetailViewController: UIViewController {
    private let viewModel: CharacterDetailViewModel
    
    private let detailView: CharacterDetailView
    
    init(viewModel: CharacterDetailViewModel) {
        self.viewModel = viewModel
        self.detailView = CharacterDetailView(frame: .zero, viewModel: viewModel)
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = viewModel.title
        view.addSubview(detailView)
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: .action,
            target: self,
            action: #selector(didTapShare)
        )
        addConstraints()
        
        detailView.collectionView?.delegate = self
        detailView.collectionView?.dataSource = self
    }
    
    
    @objc private func didTapShare() {
        //Share character info
    }
    
    func addConstraints() {
        NSLayoutConstraint.activate([
            detailView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            detailView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            detailView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            detailView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
        ])
    }
}

extension CharacterDetailViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return viewModel.sections.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let sectionType = viewModel.sections[section]
        switch sectionType {
        case .photo:
            return 1
        case .information(let viewModels):
            return viewModels.count
        case .episode(let viewModels):
            return viewModels.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let sectionType = viewModel.sections[indexPath.section]
        switch sectionType {
        case .photo(let viewModels):
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CharacterPhotoCollectionViewCell", for: indexPath) as? CharacterPhotoCollectionViewCell else {
                fatalError()
            }
            cell.configure(with: viewModels)
            return cell
        case .information(let viewModels):
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CharacterInfoCollectionViewCell", for: indexPath) as? CharacterInfoCollectionViewCell else {
                fatalError()
            }
            cell.configure(with: viewModels[indexPath.row])
            return cell
        case .episode(let viewModels):
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CharacterEpisodeCollectionViewCell", for: indexPath) as? CharacterEpisodeCollectionViewCell else {
                fatalError()
            }
            cell.configure(with: viewModels[indexPath.row])
            return cell
        }
    }
}

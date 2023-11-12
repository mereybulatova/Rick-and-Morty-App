//
//  TabBarController.swift
//  Rick and Morty
//
//  Created by Мерей Булатова on 12.11.2023.
//

import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabs()
    }
    
    func setupTabs() {
        let episodeVC = EpisodeViewController()
        let favoriteVC = FavoriteViewController()
        
        episodeVC.tabBarItem.image = UIImage(named: "episode")
        episodeVC.tabBarItem.selectedImage = UIImage(named: "episodeSelected")
        
        favoriteVC.tabBarItem.image = UIImage(named: "favorite")
        favoriteVC.tabBarItem.selectedImage = UIImage(named: "favoriteSelected")
        
        let navEpisodeVc = UINavigationController(rootViewController: episodeVC)
        let navFavoriteVC = UINavigationController(rootViewController: favoriteVC)
       
        setViewControllers([navEpisodeVc, navFavoriteVC], animated: true)
    }
}

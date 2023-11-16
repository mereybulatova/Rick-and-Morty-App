//
//  CharacterEpisodeCollectionViewCellViewModel.swift
//  Rick and Morty
//
//  Created by Мерей Булатова on 17.11.2023.
//

import Foundation

final class CharacterEpisodeCollectionViewCellViewModel {
    private let episodeDataUrl: URL?
    
    init(episodeDataUrl: URL?) {
        self.episodeDataUrl = episodeDataUrl
    }
}

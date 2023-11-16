//
//  CharacterInfoCollectionViewCellViewModel.swift
//  Rick and Morty
//
//  Created by Мерей Булатова on 17.11.2023.
//

import Foundation

final class CharacterInfoCollectionViewCellViewModel {
    public let value: String
    public let title: String
    
    init(
        value: String,
        title: String
    ) {
        self.value = value
        self.title = title
    }
}

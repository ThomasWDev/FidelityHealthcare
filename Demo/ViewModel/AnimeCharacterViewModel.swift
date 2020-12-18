//
//  AnimeCharacterViewModel.swift
//  Demo
//
//  Copyright © 2020 Thomas Woodfin. All rights reserved.
//

import UIKit


protocol AnimeCharacterViewModelProtocol {
    func didAnimeCharacters()
}

class AnimeCharacterViewModel: NSObject {

    var delegate: AnimeCharacterViewModelProtocol?

    fileprivate(set) var animeCharacters: [AnimeCharacterModel] = []

    private var animeCharacterApi = AnimeCharacterApi()

    func updateAnimeCharacters(_ searchKeyword : String = "naruto") {

        animeCharacterApi.fetchAnimeCharacters(with: searchKeyword, completion: { (animeCharactersResult, error) in
            if let error = error {
                debugPrint(error)
            } else {
                if let animeCharactersResult = animeCharactersResult {
                    self.animeCharacters = animeCharactersResult.results
                    self.delegate?.didAnimeCharacters()
                }
            }
        })
    }
}

//
//  AnimeCharacterApi.swift
//  Demo
//
//  Copyright © 2020 Thomas Woodfin. All rights reserved.
//

import UIKit
import Alamofire

struct AnimeCharacterApi {

    private let baseUrl = "https://api.jikan.moe/v3/search/"

    func fetchAnimeCharacters(with string: String, completion: @escaping (AnimeCharacterSearchModel?, Error?) -> ()) {
        let url = "\(baseUrl)anime?q=\(string)"

        AF.request(url).responseDecodable(of: AnimeCharacterSearchModel.self) { response in
            if let error = response.error {
                completion(nil, error)
                return
            }
            switch response.result {
            case .success(let animeCharacter):
                completion(animeCharacter, nil)
            case .failure(let error):
                debugPrint(error.localizedDescription)
                completion(nil, error)
            }
        }
    }
}

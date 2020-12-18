//
//  AnimeCell.swift
//  Demo
//
//  Copyright © 2020 Thomas Woodfin. All rights reserved.
//

import UIKit
import SDWebImage

class AnimeCell: UITableViewCell {

    @IBOutlet private weak var animeTitleLable: UILabel!
    @IBOutlet private weak var animeDescriptionLabel: UILabel!
    @IBOutlet private weak var scoreLabel: UILabel!
    @IBOutlet private weak var membersLabel: UILabel!
    @IBOutlet private weak var animeImageView: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        animeImageView.backgroundColor = .lightGray
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    public func setAnime(_ anime : AnimeCharacterModel) {
        animeTitleLable.text = anime.title
        animeDescriptionLabel.text = anime.synopsis
        scoreLabel.text = "Score: \(anime.score)"
        membersLabel.text = "Members: \(anime.members)"
        animeImageView.sd_setImage(with: URL(string: anime.imageUrl), completed: nil)
    }



}

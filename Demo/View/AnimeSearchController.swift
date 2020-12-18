//
//  ViewController.swift
//  Demo
//
//  Created by Thomas Woodfin on 12/16/20.
//

import UIKit

class AnimeSearchController: UIViewController, AnimeCharacterViewModelProtocol {

    @IBOutlet weak var animeTableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var activityIndicatorView: UIActivityIndicatorView!

    fileprivate let model = AnimeCharacterViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        model.delegate = self
        animeTableView.delegate = self
        animeTableView.dataSource = self
        animeTableView.tableFooterView = UIView()
        animeTableView.keyboardDismissMode = .interactive
        searchBar.delegate = self
        activityIndicatorView.hidesWhenStopped = true
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        activityIndicatorView.startAnimating()
        model.updateAnimeCharacters()
    }

    func didAnimeCharacters() {
        activityIndicatorView.stopAnimating()
        animeTableView.reloadData()
    }

}

extension AnimeSearchController : UISearchBarDelegate {

    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        activityIndicatorView.startAnimating()
        activityIndicatorView.isHidden = false
        model.updateAnimeCharacters(searchBar.text ?? "")
        searchBar.resignFirstResponder()
    }
}

extension AnimeSearchController : UITableViewDataSource, UITableViewDelegate {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.animeCharacters.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AnimeCell") as! AnimeCell
        cell.setAnime(model.animeCharacters[indexPath.row])
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

    }
}


//
//  CharactersViewController.swift
//  Homework - RickAndMorty
//
//  Created by Виталий Сабин on 10.05.2023.
//

import UIKit

final class CharactersViewController: UITableViewController {
    private var characters: [Character] = []
    private let networkManager = NetworkManager.shared

    override func viewDidLoad() {
        super.viewDidLoad()
        fetchCharacters()
    }
    
    private func fetchCharacters() {
        networkManager.fetchRickAndMorty(RickAndMorty.self, from: networkManager.url) { [weak self] result in
            switch result {
            case .success(let response):
                self?.characters = response.results
                self?.tableView.reloadData()
            case .failure(let error):
                print(error)
            }
        }
    }
}
// MARK: - TableViewDataSource

extension CharactersViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        characters.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        guard let cell = cell as? CharacterCell else { return UITableViewCell() }
        let character = characters[indexPath.row]
        cell.configure(with: character)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

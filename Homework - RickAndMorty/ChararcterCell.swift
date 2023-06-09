//
//  RickAndMortyCell.swift
//  Homework - RickAndMorty
//
//  Created by Виталий Сабин on 10.05.2023.
//

import UIKit

final class CharacterCell: UITableViewCell {
    @IBOutlet var heroImage: UIImageView!
    
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var statusLabel: UILabel!
    @IBOutlet var speciesLabel: UILabel!
    @IBOutlet var genderLabel: UILabel!
    
    private let networkManager = NetworkManager.shared
    
    func configure(with character: Character) {
        nameLabel.text = "Name: \(character.name)"
        statusLabel.text = "Status: \(character.status)"
        speciesLabel.text = "Species: \(character.species)"
        genderLabel.text = "Gender: \(character.gender)"
        
        networkManager.fetchImage(from: character.image) { [weak self] result in
            switch result {
            case .success(let imageData):
                self?.heroImage.image = UIImage(data: imageData)
            case .failure(let error):
                print(error)
            }
        }
    }
}

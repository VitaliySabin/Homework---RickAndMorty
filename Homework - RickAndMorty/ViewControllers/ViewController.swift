//
//  ViewController.swift
//  Homework - RickAndMorty
//
//  Created by Виталий Сабин on 07.05.2023.
//

import UIKit

class ViewController: UIViewController {
    
    private let url = "https://rickandmortyapi.com/api/character"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchRickAndMorty()
    }
    
    private func fetchRickAndMorty() {
        guard let url = URL(string: url) else { return }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data else {
                print(error?.localizedDescription ?? "No error description")
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let rickAndMorty = try decoder.decode(RickAndMorty.self, from: data)
                print(rickAndMorty)
            } catch {
                print(error.localizedDescription)
            }
        }.resume()
    }
}


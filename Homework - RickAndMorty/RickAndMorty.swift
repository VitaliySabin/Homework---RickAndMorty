//
//  RickAndMorty.swift
//  Homework - RickAndMorty
//
//  Created by Виталий Сабин on 07.05.2023.
//

struct RickAndMorty: Decodable {
    let results: [Character]
}

struct Character: Decodable {
    let name: String
    let status: String
    let species: String
    let gender: String
    let image: String
}

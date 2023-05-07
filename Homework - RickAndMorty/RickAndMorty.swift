//
//  RickAndMorty.swift
//  Homework - RickAndMorty
//
//  Created by Виталий Сабин on 07.05.2023.
//

struct RickAndMorty {
    let results: [Character]
}

struct Character {
    let name: String
    let status: String
    let species: String
    let gender: String
    let origin: Origin
    let location: Location
    let image: String
    let episodes: [String]
}

struct Origin {
    let name: String
    let url: String
}

struct Location {
    let name: String
    let url: String
}

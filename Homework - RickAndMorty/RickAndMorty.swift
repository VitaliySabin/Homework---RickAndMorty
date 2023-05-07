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
    let origin: Origin
    let location: Location
    let image: String
    let episode: [String]
}

struct Origin: Decodable {
    let name: String
    let url: String
}

struct Location: Decodable {
    let name: String
    let url: String
}
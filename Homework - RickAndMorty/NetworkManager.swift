//
//  NetworkManager.swift
//  Homework - RickAndMorty
//
//  Created by Виталий Сабин on 10.05.2023.
//

import Foundation

enum NetworkError: Error {
    case invalidURL
    case noData
    case decodingError
}

final class NetworkManager {
    private let url = "https://rickandmortyapi.com/api/character"
    
    static let shared = NetworkManager()
    
    private init() {}
    
    private func fetchImage(from url: URL, completion: @escaping (Result<Data, NetworkError>) -> Void) {
        DispatchQueue.global().async {
            guard let imageData = try? Data(contentsOf: url) else {
                completion(.failure(.noData))
                return
            }
            DispatchQueue.main.async {
                completion(.success(imageData))
            }
        }
    }
    
    private func fetchRickAndMorty(from url: URL, completion: @escaping (Result<Data, NetworkError>) -> Void) {
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data else {
                completion(.failure(.noData))
                print(error?.localizedDescription ?? "No error description")
                return
            }
            do {
                let decoder = JSONDecoder()
                let rickAndMorty = try decoder.decode(RickAndMorty.self, from: data)
            } catch {
                completion(.failure(.decodingError))
                print(error.localizedDescription)
            }
        }.resume()
    }
}

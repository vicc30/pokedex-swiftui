//
//  Webservice.swift
//  pokedex-swiftui
//
//  Created by Victor Cruz Galindo on 08/06/22.
//

import Foundation


enum NetworkError: Error {
  case badUrl
  case badRequest
}


class Webservice {
  func fetchPokemon(completion: @escaping (Result<[Pokemon], NetworkError>) -> Void) {

    guard let url = URL(string: "https://gist.githubusercontent.com/vicc30/c73030b7fa3640079b44eb3b52d04429/raw/4e1d91190fc40365594d68bef9e1e51bc9b57512/pokemon.json") else {

      completion(.failure(.badUrl))
      return
    }

    URLSession.shared.dataTask(with: url) { data, _, error in

      guard let data = data, error == nil else {
        completion(.failure(.badRequest))
        return
        }

      let pokemonList = try? JSONDecoder().decode([Pokemon].self, from: data)
      completion(.success(pokemonList ?? []))

    }.resume()

  }
}

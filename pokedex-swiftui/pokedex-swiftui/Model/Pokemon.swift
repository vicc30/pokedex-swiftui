//
//  Pokemon.swift
//  pokedex-swiftui
//
//  Created by Victor Cruz Galindo on 08/06/22.
//

import Foundation

struct Pokemon: Decodable {
  let id: Int
  let name: String
  let isLegendary: Bool
  let image: String
}

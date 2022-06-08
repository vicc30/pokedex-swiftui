//
//  PokemonListViewModel.swift
//  pokedex-swiftui
//
//  Created by Victor Cruz Galindo on 08/06/22.
//

import Foundation
import SwiftUI


class PokemonListViewModel: ObservableObject {

  @Published var pokemonList: [PokemonViewModel] = [PokemonViewModel]()

  func populatePokemon() {
    Webservice().fetchPokemon { (result) in

      switch result {
        case .success(let pokemonList):
        DispatchQueue.main.async {
          self.pokemonList = pokemonList.map(PokemonViewModel.init)
        }

        case .failure(let error):
          print(error)
      }
    }
  }
}

struct PokemonViewModel {

  let pokemon: Pokemon

  var id: Int {
    pokemon.id
  }

  var name: String {
    pokemon.name
  }

  var backgroundColor: Color {
    pokemon.isLegendary ? Color("legendaryBackground") : Color("normalBackground")
  }

  var circleColor: Color {
    pokemon.isLegendary ? Color("CircleColorLegendary") : Color("CircleColorNormal")
  }

  var image: String {
    pokemon.image
  }

}

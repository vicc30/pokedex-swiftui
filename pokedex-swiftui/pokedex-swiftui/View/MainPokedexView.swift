//
//  MainPokedexView.swift
//  pokedex-swiftui
//
//  Created by Victor Cruz Galindo on 08/06/22.
//

import SwiftUI

let coloredNavAppearance = UINavigationBarAppearance()

struct MainPokedexView: View {

  @StateObject private var pokemonListVM = PokemonListViewModel()

  init() {
    coloredNavAppearance.backgroundColor = UIColor(named: "pokedexNavbarColor")
    UINavigationBar.appearance().standardAppearance = coloredNavAppearance
    UINavigationBar.appearance().scrollEdgeAppearance = coloredNavAppearance
  }

  var body: some View {
    NavigationView {
      List(pokemonListVM.pokemonList, id: \.id) { pokemon in
        NavigationLink(destination: PokemonDetailView(pokemon: pokemon)) {
          Text(pokemon.name)
        }
      }
      .listStyle(.plain)
      .onAppear {
        pokemonListVM.populatePokemon()
      }
      .toolbar {
        ToolbarItem(placement: .principal) {
          Image("pokemonLogo")
            .resizable()
            .scaledToFit()
        }
      }
    }
  }
}

struct MainPokedexView_Previews: PreviewProvider {
  static var previews: some View {
    MainPokedexView()
  }
}

//
//  PokemonDetail.swift
//  pokedex-swiftui
//
//  Created by Victor Cruz Galindo on 08/06/22.
//

import SwiftUI

struct PokemonDetailView: View {

  let pokemon: PokemonViewModel

  var body: some View {

    ZStack{

      pokemon.backgroundColor.edgesIgnoringSafeArea(.all)

      VStack {
        Spacer()
        Text(pokemon.name)
          .font(.title)
          .bold()
          .foregroundColor(.white)
        Image(pokemon.image)
          .resizable()
          .scaledToFit()
          .frame(width: 200, height: 200)
          .clipShape(Circle())
          .shadow(radius: 10)
          .background(
            Circle()
              .fill(pokemon.circleColor)
              .frame(width: 150, height: 150))
          .padding()
        Spacer()
      }
    }

  }
}

struct PokemonDetailView_Previews: PreviewProvider {
  static var previews: some View {
    PokemonDetailView(pokemon: PokemonViewModel(pokemon: Pokemon(id: 1, name: "Pikachu", isLegendary: true, image: "pikachu")))
  }
}

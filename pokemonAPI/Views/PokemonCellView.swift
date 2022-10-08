//
//  PokemonCellView.swift
//  pokemonAPI
//
//  Created by Akshay Anil Jadhav on 08/10/22.
//

import SwiftUI
import Kingfisher

let data = Pokemon(id: 1, name: "Name", imageUrl: "https://firebasestorage.googleapis.com/v0/b/pokedex-bb36f.appspot.com/o/pokemon_images%2F2CF15848-AAF9-49C0-90E4-28DC78F60A78?alt=media&token=15ecd49b-89ff-46d6-be0f-1812c948e334", type: "poison", description: "Random", attack: 10, defense: 10, weight: 10)

let sampleViewModel = PokemonViewModel()

struct PokemonCellView: View {
    let pokemon: Pokemon
    let viewModel: PokemonViewModel
    var body: some View {
        ZStack {
            VStack(alignment: .leading) {
                Text(pokemon.name.capitalized)
                    .font(.system(size: 20, weight: .semibold, design: .serif))
                    .foregroundColor(.black)
                    .padding(.top, 20)
                    .padding(.leading)
                HStack {
                    Text(pokemon.type.capitalized)
                        .font(.system(size: 16, weight: .medium, design: .serif))
                        .foregroundColor(.black)
                        .padding(.horizontal, 16)
                        .padding(.vertical, 8)
                        .overlay(
                            RoundedRectangle(cornerRadius: 40).fill(Color.white.opacity(0.2))
                                .frame(width: 100, height: 24)
                        )
                   
                    KFImage(URL(string: pokemon.imageUrl))
                        .resizable()
                        .scaledToFit()
                        .frame(width: 68, height: 68)
                        .padding([.bottom, .trailing], 4)
                }
            }
        }.background(Color(viewModel.backgroundColor(forType: pokemon.type)).opacity(0.3))
            .clipShape(RoundedRectangle(cornerRadius: 30))
            .padding(.all,6)
            .shadow(color: .black, radius: 8, x: 8, y: 8)
    }
}

struct PokemonCellView_Previews: PreviewProvider {
    
    static var previews: some View {
        PokemonCellView(pokemon: data, viewModel: sampleViewModel)
    }
}

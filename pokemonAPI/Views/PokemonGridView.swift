//
//  PokemonGridView.swift
//  pokemonAPI
//
//  Created by Akshay Anil Jadhav on 08/10/22.
//

import SwiftUI

struct PokemonGridView: View {
    private let gridItems = [GridItem(.flexible()), GridItem(.flexible())]
    @ObservedObject var viewModel = PokemonViewModel()
    
    var body: some View {
        NavigationView {
            ZStack {
                LinearGradient(gradient: Gradient(colors: [Color.green.opacity(0.2),Color.pink.opacity(0.3)]), startPoint: .topLeading, endPoint: .bottomTrailing)
                    .edgesIgnoringSafeArea(.all)
                
                ScrollView{
                    LazyVGrid(columns: gridItems,spacing: 16) {
                        ForEach(viewModel.pokemons, id: \.id) { pokemon in
                            NavigationLink {
                                PokemonDetailView(pokemon: pokemon, viewModel: viewModel)
                            } label: {
                                PokemonCellView(pokemon: pokemon, viewModel: viewModel)
                            }
                        }
                    }
                }.navigationTitle("Pokemon Club")
            }
        }.navigationBarHidden(true)
    }
}

struct PokemonGridView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonGridView()
    }
}

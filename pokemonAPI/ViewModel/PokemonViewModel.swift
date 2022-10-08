//
//  PokemonViewModel.swift
//  pokemonAPI
//
//  Created by Akshay Anil Jadhav on 08/10/22.
//

import Foundation
import SwiftUI

class PokemonViewModel: ObservableObject {
    @Published var pokemons = [Pokemon]()
    let baseURL = "https://pokedex-bb36f.firebaseio.com/pokemon.json"
    
    init(){
        fetchData()
    }
    
    func fetchData() {
        guard let url = URL(string: baseURL) else {
            return
        }
        
        URLSession.shared.dataTask(with: url) {
            (data, response, error) in
            
            // remove the "null," from response
            guard let data = data?.parseData(removeString: "null,") else {
                return
            }
                  
            // decode data
            guard let pokemons = try? JSONDecoder().decode([Pokemon].self, from: data) else {
                return
            }
            
            // store the data
            DispatchQueue.main.async {
                self.pokemons = pokemons
            }
        }.resume()
    }
    
    func backgroundColor(forType type: String) -> UIColor {
        switch type {
            case "fire": return .orange
            case "poison": return .purple
            case "water": return .blue
            case "electric": return .yellow
            case "psychic": return .brown
            case "normal": return .magenta
            case "ground": return .green
            case "flying": return .cyan
            case "fairy": return .systemTeal
            default: return .systemPink
        }
    }
}

//reusable code
// adding custom parseData method on Data
extension Data {
    func parseData(removeString string: String) -> Data? {
        // convert Data into string
        let dataAsString = String(data: self, encoding: .utf8)
        //replace all occurrences of given param into empty string
        let parsedDataString = dataAsString?.replacingOccurrences(of: string, with: "")
        // convert string into Data
        guard let data = parsedDataString?.data(using: .utf8) else {
            return nil
        }
        return data
    }
}

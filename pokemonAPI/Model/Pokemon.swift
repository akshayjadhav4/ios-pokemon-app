//
//  Pokemon.swift
//  pokemonAPI
//
//  Created by Akshay Anil Jadhav on 08/10/22.
//

import Foundation

struct Pokemon: Decodable, Identifiable {
    let id: Int
    let name: String
    let imageUrl: String
    let type: String
    let description: String
    let attack: Int
    let defense: Int
    let weight: Int
}

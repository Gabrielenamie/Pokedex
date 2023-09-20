//
//  PokemonList.swift
//  Pokedex
//
//  Created by Gabriele Namie on 28/08/23.
//

import Foundation

struct PokemonList: Decodable {

    let results: [Pokemon]?
    
    init(results: [Pokemon]? = []) {
        self.results = results
    }
}

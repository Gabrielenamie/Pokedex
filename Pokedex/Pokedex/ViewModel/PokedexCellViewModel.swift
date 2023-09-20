//
//  PokedexCellViewModel.swift
//  Pokedex
//
//  Created by Gabriele Namie on 03/09/23.
//

import UIKit

class PokedexCellViewModel {
    
    private var pokemon: Pokemon
    
    init(pokemon: Pokemon) {
        self.pokemon = pokemon
    }
    
    var name: String {
        return pokemon.name.capitalized
    }

    var id: String {
        return pokemon.id ?? ""
    }
}

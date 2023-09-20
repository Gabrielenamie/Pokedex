//
//  PokemonModel.swift
//  Pokedex
//
//  Created by Gabriele Namie on 22/08/23.
//

struct PokemonModel: Decodable {

    let id: Int
    let name: String
    let height: Int
    let weight: Int
    let abilities: [Abilities]
    let types: [Types]
    let forms: [Form]
    
    var idString: String { String(describing: id) }
    
    init(id: Int = 0,
         name: String = "",
         height: Int = 0,
         weight: Int = 0,
         abilities: [Abilities] = [],
         types: [Types] = [],
         forms: [Form] = []) {
        self.id = id
        self.name = name
        self.height = height
        self.weight = weight
        self.abilities = abilities
        self.types = types
        self.forms = forms
    }
}

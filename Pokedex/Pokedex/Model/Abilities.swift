//
//  Abilities.swift
//  Pokedex
//
//  Created by Gabriele Namie on 28/08/23.
//

struct Abilities: Decodable {

    let ability: Ability
}

struct Ability: Decodable {

    let name: String
}

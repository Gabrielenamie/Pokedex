//
//  PokemonServiceProtocol.swift
//  Pokedex
//
//  Created by Gabriele Namie on 28/08/23.
//

import Foundation

protocol PokemonListServiceProtocol {

    func getPokemonList(onComplete: @escaping (Result<PokemonList, APIError>) -> Void)
    func getPokemon(id: String, onComplete: @escaping (Result<PokemonModel, APIError>) -> Void)
}

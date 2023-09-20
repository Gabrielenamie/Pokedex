//
//  PokemonService.swift
//  Pokedex
//
//  Created by Gabriele Namie on 23/08/23.
//

import Foundation

final class PokemonListService: PokemonListServiceProtocol {

    func getPokemonList(onComplete: @escaping (Result<PokemonList, APIError>) -> Void) {
        let request = PokemonRequest(requestType: .pokemonList)
        request.pokemonList { result in
            switch result {
            case let .success(list):
                onComplete(.success(list))
            case let .failure(error):
                onComplete(.failure(error))
            }
        }
    }
    
    func getPokemon(id: String, onComplete: @escaping (Result<PokemonModel, APIError>) -> Void) {
        let request = PokemonRequest(requestType: .pokemonDetail(id: id))
        request.pokemonDetail { result in
            switch result {
            case let .success(detail):
                onComplete(.success(detail))
            case let .failure(error):
                onComplete(.failure(error))
            }
        }
    }
}

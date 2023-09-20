//
//  PokedexInfoViewModelProtocol.swift
//  Pokedex
//
//  Created by Gabriele Namie on 28/08/23.
//

protocol PokedexInfoViewModelProtocol {

    var view: PokedexInfoProtocol? { get set }
    var pokemonDetail: PokemonModel { get }
}

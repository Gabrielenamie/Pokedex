//
//  PokedexViewModelProtocol.swift
//  Pokedex
//
//  Created by Gabriele Namie on 28/08/23.
//

import Foundation

protocol PokedexViewModelProtocol {

    var view: PokedexViewProtocol? { get set }
    var countPokemons: Int { get }
    
    func fetchPokemonList()
    func fetchPokemon(by id: String)
    func openDetailFor(indexPath: IndexPath)
    func cellViewModelFor(at indexPath: IndexPath) -> PokedexCellViewModel
}

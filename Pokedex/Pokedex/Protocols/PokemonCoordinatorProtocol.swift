//
//  PokemonCoordinatorProtocol.swift
//  Pokedex
//
//  Created by Gabriele Namie on 28/08/23.
//

import Foundation

protocol PokemonListCoordinatorProtocol: AnyObject, AlertPresenterProtocol {

    func showDetail(for pokemonDetail: PokemonModel)
}

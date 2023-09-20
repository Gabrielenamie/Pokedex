//
//  PokemonViewProtocol.swift
//  Pokedex
//
//  Created by Gabriele Namie on 28/08/23.
//

import UIKit

protocol PokedexViewProtocol: AnyObject {

    func reloadCollectionView()
    func showLoading(_ show: Bool)
}

//
//  PokedexCoordinator.swift
//  Pokedex
//
//  Created by Gabriele Namie on 28/08/23.
//

import UIKit

class PokedexCoordinator: CoordinatorProtocol, PokemonListCoordinatorProtocol {
    
    var navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let viewModel = PokedexViewModel(coordinator: self)
        let pokemonListVC = PokedexViewController(viewModel: viewModel, contentView: PokedexView(viewModel: viewModel))
        navigationController.pushViewController(pokemonListVC, animated: true)
    }
}

extension PokedexCoordinator: PokedexCoordinatorProtocol {

    func showDetail(for pokemonDetail: PokemonModel) {
        let pokemonDetail = PokedexInfoCoordinator(
            navigationController: navigationController,
            detail: pokemonDetail
        )
        coordinate(to: pokemonDetail)
    }
}

//
//  PokedexInfoCoordinator.swift
//  Pokedex
//
//  Created by Gabriele Namie on 23/08/23.
//

import UIKit

final class PokedexInfoCoordinator: CoordinatorProtocol, PokedexCoordinatorProtocol {
    
    var navigationController: UINavigationController
    private var detail: PokemonModel
    
    init(navigationController: UINavigationController,
         detail: PokemonModel) {
        self.navigationController = navigationController
        self.detail = detail
    }
    
    func start() {
        let viewModel = PokedexInfoViewModel(coordinator: self, detail: detail)
        let pokedex = PokedexInfoView(viewModel: viewModel)
        let pokemonDetailVC = PokedexInfoViewController(viewModel: viewModel as PokedexInfoViewModelProtocol, contentView: pokedex)
        navigationController.modalPresentationStyle = .automatic
        navigationController.present(pokemonDetailVC, animated: true, completion: nil)
    }
}

extension PokedexInfoCoordinator: PokedexInfoProtocol {}


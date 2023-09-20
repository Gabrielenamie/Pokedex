//
//  AppCoordinator.swift
//  Pokedex
//
//  Created by Gabriele Namie on 22/08/23.
//

import UIKit

final class AppCoordinator: CoordinatorProtocol {
    
    let navigationController: UINavigationController
    private let window: UIWindow
    
    init(window: UIWindow) {
        self.window = window
        self.navigationController = UINavigationController()
    }
    
    func start() {
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
        
        self.showPokemonList()
    }
    
    private func showPokemonList() {
        let startCoordinator = PokedexCoordinator(navigationController: navigationController)
        coordinate(to: startCoordinator)
    }
}

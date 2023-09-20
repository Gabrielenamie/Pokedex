//
//  CoordinatorProtocol.swift
//  Pokedex
//
//  Created by Gabriele Namie on 22/08/23.
//

import UIKit

protocol CoordinatorProtocol {

    var navigationController: UINavigationController { get }
    
    func start()
    func coordinate(to coordinator: CoordinatorProtocol)
}

extension CoordinatorProtocol {

    func coordinate(to coordinator: CoordinatorProtocol) {
        DispatchQueue.main.async {
            coordinator.start()
        }
    }
}


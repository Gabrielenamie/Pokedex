//
//  ViewCodeProtocol.swift
//  Pokedex
//
//  Created by Gabriele Namie on 23/08/23.
//

import Foundation

protocol MinimumViewMethodsProtocol {

    func setupHierarchy()
    func setupConstraints()
    func additionalSetup()
    func buildView()
}

extension MinimumViewMethodsProtocol {

    func buildView() {
        setupHierarchy()
        setupConstraints()
        additionalSetup()
    }

    func additionalSetup() {}
}

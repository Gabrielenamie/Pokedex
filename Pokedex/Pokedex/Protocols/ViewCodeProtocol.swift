//
//  ViewCodeProtocol.swift
//  Pokedex
//
//  Created by Gabriele Namie on 23/08/23.
//

import Foundation

// TODO: better naming
protocol ViewCodeProtocol {

    func setupHierarchy()
    func setupConstraints()
    func additionalSetup()
    func buildView()
}

extension ViewCodeProtocol {

    func buildView() {
        setupHierarchy()
        setupConstraints()
        additionalSetup()
    }

    func additionalSetup() {}
}

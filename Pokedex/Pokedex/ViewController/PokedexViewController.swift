//
//  PokedexViewController.swift
//  Pokedex
//
//  Created by Gabriele Namie on 13/09/23.
//

import UIKit

final class PokedexViewController: UIViewController {

    private var viewModel: PokedexViewModelProtocol!
    private var contentView: PokedexView!

    init(viewModel: PokedexViewModelProtocol, contentView: PokedexView) {
        self.viewModel = viewModel
        self.contentView = contentView
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func loadView() {
        self.view = contentView
        title = "Pokedex"
        setCustomStyle()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        viewModel.fetchPokemonList()
    }
    
    private func setCustomStyle() {
        let font = UIFont.systemFont(ofSize: 16)
        navigationController?.navigationBar.titleTextAttributes = [.font: font]
        UIBarButtonItem.appearance(whenContainedInInstancesOf: [UISearchBar.self])
            .setTitleTextAttributes([.font: font], for: .normal)
    }
}

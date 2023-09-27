//
//  ViewController.swift
//  Pokedex
//
//  Created by Gabriele Namie on 22/08/23.
//

import UIKit

final class PokedexInfoViewController: UIViewController {
        
    private var viewModel: PokedexInfoViewModelProtocol!
    private var contentView: PokedexInfoView!
    
    init(viewModel: PokedexInfoViewModelProtocol, contentView: PokedexInfoView) {
        self.viewModel = viewModel
        self.contentView = contentView
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func loadView() {
        self.view = contentView
    }
}


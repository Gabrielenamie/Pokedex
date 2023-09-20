//
//  PokedexInfoViewModel.swift
//  Pokedex
//
//  Created by Gabriele Namie on 03/09/23.
//

class PokedexInfoViewModel {
    
    weak var view: PokedexInfoProtocol?
    
    private var coordinator: PokedexCoordinatorProtocol?
    private var detail: PokemonModel

    init(coordinator: PokedexCoordinatorProtocol,
         detail: PokemonModel) {
        self.coordinator = coordinator
        self.detail = detail
    }
}

extension PokedexInfoViewModel: PokedexInfoViewModelProtocol {

    var pokemonDetail: PokemonModel { return detail }
}

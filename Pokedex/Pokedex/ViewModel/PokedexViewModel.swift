//
//  PokedexViewModel.swift
//  Pokedex
//
//  Created by Gabriele Namie on 03/09/23.
//

import UIKit
// struct x class
class PokedexViewModel {
    
    weak var view: PokedexViewProtocol?
    
    private var coordinator: PokemonListCoordinatorProtocol?
    private var pokemonList: [Pokemon] = []

    private let service: PokemonListServiceProtocol

    init(coordinator: PokemonListCoordinatorProtocol,
         service: PokemonListServiceProtocol = PokemonListService()) {
        self.coordinator = coordinator
        self.service = service
    }

    private func getPokemonInList(at index: Int) -> Pokemon {
        updatePokemonIdIfNedeed(index)
        return pokemonList[index]
    }
    
    private func updatePokemonIdIfNedeed(_ index: Int) {
        guard !pokemonList.isEmpty && pokemonList[index].id == nil else {
            return
        }
        pokemonList[index].id = "\(index+1)"
    }

    private func updatePokemonList(with newList: [Pokemon]) {
        self.pokemonList.removeAll()
        self.pokemonList = newList
    }

    private func showDetail(for detail: PokemonModel) {
        coordinator?.showDetail(for: detail)
    }
 
    private func getPokemonList() {
        view?.showLoading(true)
        
        service.getPokemonList { [weak self] result in
            guard let self = self else { return }
            self.view?.showLoading(false)
            
            switch result {
            case let .success(list):
                guard let pokemonList = list.results else { return }
                self.updatePokemonList(with: pokemonList)
                self.view?.reloadCollectionView()
            case .failure:
                self.showFailureAlert()
            }
        }
    }
    
    private func getPokemon(by id: String, showDetail: Bool = false) {
        view?.showLoading(true)
        
        service.getPokemon(id: id, onComplete: { [weak self] result in
            guard let self = self else { return }
            self.view?.showLoading(false)
            
            switch result {
            case let .success(pokemon):
                if showDetail {
                    self.showDetail(for: pokemon)
                    return
                }
                let pokemon = [Pokemon(name: pokemon.name, id: pokemon.id)]
                self.updatePokemonList(with: pokemon)
                self.view?.reloadCollectionView()
            case .failure:
                self.showFailureAlert()
            }
        })
    }
    
    private func showFailureAlert() {
        let alert = Alert.make(title: "Error", message: "Deu Ruim")
        self.coordinator?.alertPresenter(alert)
    }
}

extension PokedexViewModel: PokedexViewModelProtocol {

    var countPokemons: Int {
        return pokemonList.count
    }

    func fetchPokemonList() {
        getPokemonList()
    }
    
    func fetchPokemon(by id: String) {
        getPokemon(by: id)
    }

    func cellViewModelFor(at indexPath: IndexPath) -> PokedexCellViewModel {
        let pokemon = getPokemonInList(at: indexPath.row)
        return PokedexCellViewModel(pokemon: pokemon)
    }
    
    func openDetailFor(indexPath: IndexPath) {
        guard let id = getPokemonInList(at: indexPath.row).id else { return }
        getPokemon(by: id, showDetail: true)
    }
}


//
//  PokedexViewModelTests.swift
//  PokedexTests
//
//  Created by Gabriele Namie on 22/08/23.
//

import XCTest
@testable import Pokedex

class PokedexViewModelTests: XCTestCase {

    var viewModel: PokedexViewModel!

    override func setUp() {
        super.setUp()
        viewModel = PokedexViewModel(coordinator: MockPokemonListCoordinator(), service: MockPokemonListService())
    }

    override func tearDown() {
        viewModel = nil
        super.tearDown()
    }

    func testFetchPokemonList() {
        let expectation = XCTestExpectation(description: "Fetch Pokémon List")

        viewModel.fetchPokemonList()

        DispatchQueue.global().asyncAfter(deadline: .now() + 1) {
            XCTAssertEqual(self.viewModel.countPokemons, 1292)
            expectation.fulfill()
        }

        wait(for: [expectation], timeout: 5.0)
    }

    func testFetchPokemonById() {
        let expectation = XCTestExpectation(description: "Fetch Pokémon by ID")

        viewModel.fetchPokemon(by: "1")

        DispatchQueue.global().asyncAfter(deadline: .now() + 1) {
            // Assert that the Pokémon list has been updated
            XCTAssertEqual(self.viewModel.countPokemons, 1)

            // Assert that the first Pokémon's ID is "1"
            XCTAssertEqual(self.viewModel.cellViewModelFor(at: IndexPath(row: 0, section: 0)).id, "1")

            expectation.fulfill()
        }

        wait(for: [expectation], timeout: 2.0)
    }

    func testOpenDetailForIndexPath() {
        let expectation = XCTestExpectation(description: "Open Pokémon Detail")

        viewModel.fetchPokemonList()

        DispatchQueue.global().asyncAfter(deadline: .now() + 1) {
            self.viewModel.openDetailFor(indexPath: IndexPath(row: 0, section: 0))
            expectation.fulfill()
        }

        wait(for: [expectation], timeout: 2.0)
    }
}

class MockPokemonListCoordinator: PokemonListCoordinatorProtocol {
    
    var name: String = "Pikachu"
    var height: Int = 2
    var weight: Int = 4
    var abilities: [Abilities] = []
    var types: [Types] = []
    var forms: [Form] = []
    
    func showDetail(for pokemonDetail: Pokedex.PokemonModel) {
        
    }
    
    func alertPresenter(_ alert: UIAlertController) {
        
    }

}

class MockPokemonListService: PokemonListServiceProtocol {
    
    var shouldSucceed: Bool = true
    var mockPokemonList: [Pokemon] = [] 

    func getPokemonList(onComplete: @escaping (Result<PokemonList, APIError>) -> Void) {
        let request = PokemonRequest(requestType: .pokemonList)
        request.pokemonList { result in
            switch result {
            case let .success(list):
                onComplete(.success(list))
            case let .failure(error):
                onComplete(.failure(error))
            }
        }
    }
    
    func getPokemon(id: String, onComplete: @escaping (Result<PokemonModel, APIError>) -> Void) {
        let request = PokemonRequest(requestType: .pokemonDetail(id: id))
        request.pokemonDetail { result in
            switch result {
            case let .success(detail):
                onComplete(.success(detail))
            case let .failure(error):
                onComplete(.failure(error))
            }
        }
    }
}

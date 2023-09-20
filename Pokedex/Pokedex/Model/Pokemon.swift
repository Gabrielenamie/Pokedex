//
//  Pokemon.swift
//  Pokedex
//
//  Created by Gabriele Namie on 28/08/23.
//

struct Pokemon: Decodable {

    let name: String
    var id: String?
    
    init(name: String = "", id: Int = 0) {
        self.name = name
        self.id = String(describing: id)
    }
}

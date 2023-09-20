//
//  Types.swift
//  Pokedex
//
//  Created by Gabriele Namie on 28/08/23.
//

struct Types: Decodable {

    let type: Type
}

struct Type: Decodable {

    let name: String
}

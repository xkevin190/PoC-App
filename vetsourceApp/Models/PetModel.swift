//
//  PetModel.swift
//  vetsourceApp
//
//  Created by Kevin Velasco on 8/5/23.
//

import Foundation

struct Pet: Identifiable {
    var id = UUID()
    var name: String
    var age: String
    var weight: String
    var orders: Int
    var image: String
    var Product: [Product]
}


extension Pet {
    static var preview: Pet {
        return Pet(name: "Mia", age: "10/02/2018", weight: "5", orders: 3, image: "dog", Product: [])
    }
}

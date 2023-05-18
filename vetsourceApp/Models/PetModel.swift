//
//  PetModel.swift
//  vetsourceApp
//
//  Created by Kevin Velasco on 8/5/23.
//

import Foundation

struct Pet: Identifiable, Equatable {
    static func == (lhs: Pet, rhs: Pet) -> Bool {
       return  lhs.id == rhs.id
    }
    
    var id = UUID()
    var name: String
    var age: String
    var weight: String
    var orders: Int
    var image: String
    var product: [Product]
}


extension Pet {
    static var preview: Pet {
        return Pet(name: "Mia", age: "10/02/2018", weight: "5", orders: 3, image: "dog", product: [])
    }
    
    static var setPets: [Pet] {
        var _pet: [Pet] = []
        _pet.append(
        Pet(
            name: "Mia",
            age: "10/02/2018",
            weight: "8",
            orders: 1,
            image: "dog",
            product: [Product(
                name: "GlycoFLEX® 2 Bite-Sized Chews",
                quantity: 2,
                size: "Dog",
                pakage: "120 chewables",
                image: "product2",
                productStatus: ProductStatus(currentStatus: status.updateRequired, reason: "Your pet’s weight was changed in their pet profile, and your product needs a dose update to ensure the AutoShip is sent on time.", nexQuantity: 2),
                nextAutShip: "25/05/2023",
                frecuency: "montly"
            )]
        ))
        _pet.append(
        Pet(
            name: "Daisy",
            age: "11/03/2020",
            weight: "2",
            orders: 1,
            image: "cat",
            product: [Product(
                name: "Phycox®",
                quantity: 1,
                size: "Small bites",
                pakage: "120 chewables", image: "product1",
                productStatus: ProductStatus(currentStatus: status.active, reason: "", nexQuantity: 0),
                nextAutShip: "27/05/2023",
                frecuency: "montly")
            ]
        ))
        _pet.append(Pet(name: "Poppy", age: "11/03/2018", weight: "4", orders: 0, image: "dog2", product: []))
        
        
        return _pet
    }
}

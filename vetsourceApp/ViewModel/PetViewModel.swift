//
//  PetViewModel.swift
//  vetsourceApp
//
//  Created by Kevin Velasco on 8/5/23.
//

import Foundation
import SwiftUI

class PetViewModel: ObservableObject {
   @Published var pets: [Pet] = []
   @Published var newName = ""
   @Published var newAge = ""
   @Published var newWeight = ""
    
    init() {
        self.pets.append(Pet(name: "Mia", age: "10/02/2018", weight: "5", orders: 3, image: "dog"))
        self.pets.append(Pet(name: "Daisy", age: "11/03/2020", weight: "2", orders: 1, image: "cat"))
        self.pets.append(Pet(name: "Poppy", age: "11/03/2018", weight: "4", orders: 0, image: "dog2"))
    }
    
    
    func changeName (id: UUID) {
        
        let result = pets.firstIndex { pet in
            return pet.id == id
        }
        
        if let index = result {
            pets[index].name = newName
            newName = ""
        }
    }
    
    func changeAge (id: UUID) {
        let result = pets.firstIndex { pet in
            return pet.id == id
        }
        
        if let index = result {
            pets[index].age = newAge
            newAge = ""
        }
    }
    
    func changeWeight (id: UUID) {
        
        let result = pets.firstIndex { pet in
            return pet.id == id
        }
        
        if let index = result {
            pets[index].weight = newWeight
            newWeight = ""
        }
    }
    
    
    
    func getPickerValue () -> [PickerModel] {
        
        var value: [PickerModel] = []
        
        pets.forEach { pet in
            value.append(PickerModel(id: pet.id, name: pet.name))
        }
        
        return value
    }
    
    
}

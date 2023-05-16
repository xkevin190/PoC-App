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
    @Published var petSelected: UUID = UUID();
    @Published var edit: Bool = false;
    @Published var productToEdit = UUID()
    @Published var toastShow = false;
    
    init() {
        self.pets.append(
            Pet(
                name: "Mia",
                age: "10/02/2018",
                weight: "5",
                orders: 3,
                image: "dog",
                Product: [Product(
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
        self.pets.append(
            Pet(
                name: "Daisy",
                age: "11/03/2020",
                weight: "2",
                orders: 1,
                image: "cat",
                Product: [Product(
                    name: "Phycox®",
                    quantity: 1,
                    size: "Small bites",
                    pakage: "120 chewables", image: "product1",
                    productStatus: ProductStatus(currentStatus: status.active, reason: "", nexQuantity: 0),
                    nextAutShip: "27/05/2023",
                    frecuency: "montly")
                ]
            ))
        self.pets.append(Pet(name: "Poppy", age: "11/03/2018", weight: "4", orders: 0, image: "dog2", Product: []))
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
    
    
    
    var getPetSelected: [Product] {
        let result = pets.firstIndex {
            $0.id == petSelected
        }
        
        if result != nil {
            return pets[result!].Product
        }
        
        return []
    }
    
    
    
    var getProductToEdit: Product? {
        let result = pets.firstIndex {
            $0.id == petSelected
        }

        if result != nil {
            let _products =  pets[result!].Product

           let index = _products.firstIndex { item in
                item.id == productToEdit
            }
            
            if (index != nil ) {
                return _products[index!]
            }
            
        }
        
        return nil
    }
    
    
    func updateDose () {
        self.toastShow = true;
        
        let result = pets.firstIndex {
            $0.id == petSelected
        }

        if result != nil {
            var _products =  pets[result!].Product

           let index = _products.firstIndex { item in
                item.id == productToEdit
            }
            
            if (index != nil ) {
                var newPetData = _products[index!]
                newPetData.quantity = newPetData.quantity + newPetData.productStatus.nexQuantity
                newPetData.productStatus = ProductStatus(currentStatus: status.active, reason: "", nexQuantity: 0)
                
                
                pets[result!].Product[index!] = newPetData
            }
            
        }
    }
    
    
}

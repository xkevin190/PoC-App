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
    var notificationService : NotificationModel
    
    init(notification: NotificationModel) {
        self.pets = Pet.setPets
        self.notificationService = notification
        
        notificationService.sendLocalNotification(title: "Update \(pets[1].name)'s weight" , subtitle: "\(pets[1].name) is Growing fast, Update her wifht to match their orders", action: "toProfile", petId: pets[1].id)
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
            return pets[result!].product
        }
        
        return []
    }
    
    
    
    var getProductToEdit: Product? {
        let result = pets.firstIndex {
            $0.id == petSelected
        }
        
        if result != nil {
            let _products =  pets[result!].product
            
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
            var _products =  pets[result!].product
            
            let index = _products.firstIndex { item in
                item.id == productToEdit
            }
            
            if (index != nil ) {
                var newPetData = _products[index!]
                newPetData.quantity = newPetData.quantity + newPetData.productStatus.nexQuantity
                newPetData.productStatus = ProductStatus(currentStatus: status.active, reason: "", nexQuantity: 0)
                
                
                pets[result!].product[index!] = newPetData
            }
            
        }
    }
    
    
    func age(birthdate: Date) -> Int {
        let calendar = Calendar.current
        let now = Date()
        let ageComponents = calendar.dateComponents([.year], from: birthdate, to: now)
        return ageComponents.year ?? 0
    }
    
    
    var isNecesaryFixSomething: InfoCardModel? {
        
        let indexPet = pets.firstIndex { pet in
            pet.id == self.petSelected
        }
        
        
        guard indexPet != nil else {
            return nil
        }
        
        let pet = pets[indexPet!]
        let dateString = pets[indexPet!].age
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy"
        
        let date = dateFormatter.date(from: dateString)
        let _age = age(birthdate: date!);
        print("enter here!!!!", _age <=  Int(pet.weight)! )
        if(_age >=  Int(pet.weight)! ) {
            return InfoCardModel(name: "Fix Weight", incomingOrder: "\(pet.name)'s weight does not correspond to her age please update her weight", important: true, action: true)
        }

        return nil
    }
    
    
    var incomingsOrders: InfoCardModel?  {
        let indexPet = pets.firstIndex {pet in
            pet.id == self.petSelected
        }
        
        
        guard indexPet != nil else {
            return nil
        }
        
        let _pet = pets[indexPet!]
        if (!_pet.product.isEmpty){
            
            return InfoCardModel(name: "Incoming Order", incomingOrder: _pet.product[0].name ,date: _pet.product[0].nextAutShip, time: "12:00 PM", important: false, action: false)
        }
        
        return nil;
    }
    
    
}

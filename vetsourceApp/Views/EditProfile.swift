//
//  SwiftUIView.swift
//  vetsourceApp
//
//  Created by Kevin Velasco on 8/5/23.
//

import SwiftUI

struct EditProfile: View {
    @EnvironmentObject var petModel: PetViewModel
    var pet: Pet
    var body: some View {
        VStack {
            ZStack(alignment: .top) {
                Color.white
                Image("headerEdit").resizable().frame(height: Device.screenHeight * 0.23)
                
                VStack () {
                    SmallCard(pet: pet)
                    
                    EditSection(text: $petModel.newName, label: "Name", placeholder: pet.name, save: {
                        petModel.changeName(id: pet.id)
                    })
                        .padding(.horizontal)
                        .padding(.top, Device.screenHeight * 0.05)
                    
                    EditSection(text: $petModel.newAge, label: "Birthday", placeholder: pet.age, save: {
                        petModel.changeAge(id: pet.id)
                    }).padding(.horizontal)
                    
                    
                    EditSection(text: $petModel.newWeight, label: "Weight", placeholder: pet.weight, save: {
                        petModel.changeWeight(id: pet.id)
                    })
                        .padding(.horizontal)
                    
                    
                    Spacer()
                }
                .padding(.top, Device.screenHeight * 0.14)
                .frame(
                    height: Device.screenHeight
                )
                .navigationTitle("Pet Profile ").navigationBarTitleDisplayMode(.inline)
            }
        }.ignoresSafeArea()
        
    }
}

struct EditProfile_Previews: PreviewProvider {
    static var previews: some View {
        EditProfile(pet: Pet.preview)
    }
}

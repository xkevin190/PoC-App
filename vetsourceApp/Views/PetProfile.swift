//
//  PetProfile.swift
//  vetsourceApp
//
//  Created by Kevin Velasco on 6/5/23.
//

import SwiftUI

struct PetProfile: View {
    var petSelected: Pet
    
    @EnvironmentObject var petModel: PetViewModel
    
    @State var edit: Bool = false
    
    var body: some View {
        
        ZStack(alignment: .top) {
            Color.white
            Image("headerProfile").resizable().frame(height: Device.screenHeight * 0.4)
            Image(petSelected.image).resizable().frame(width: Device.screenWidth * 0.5, height: Device.screenHeight * 0.3).padding(.top, Device.screenHeight * 0.05)
            
            VStack{
                CardInProfile(pet: petSelected, action: {
                    edit.toggle()
                }).padding(.top, Device.screenHeight * 0.3)
            }
        }
        .ignoresSafeArea()
        .background(
            NavigationLink(
                destination: EditProfile(pet: petSelected),
                isActive: $edit,
                label: { EmptyView() })
        )
    }
}

struct PetProfile_Previews: PreviewProvider {
    static var previews: some View {
        PetProfile(petSelected: Pet(name: "Mia", age: "10/02/2018", weight: "5", orders: 3, image: "dog", Product: []))
    }
}

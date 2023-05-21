//
//  PickerPets.swift
//  vetsourceApp
//
//  Created by Kevin Velasco on 9/5/23.
//

import SwiftUI

struct PickerPets: View {
    @State var selectedStrength: PickerModel
    let items: [PickerModel]
    let action: (_ value: PickerModel)-> Void
    
    
    init(initalValue: PickerModel,  items: [PickerModel], action: @escaping (_ value: PickerModel)-> Void) {
        print("initialValue", initalValue)
        self._selectedStrength = State(initialValue: initalValue)
        self.items = items
        self.action = action
    }
    
    var body: some View {
        VStack {
            Menu {
                ForEach(items){ item in
                    Button(item.name) {
                        selectedStrength = item
                        action(item)
                    }
                }
                
            } label: {
                VStack {
                    Image(selectedStrength.image).resizable().frame(width: Device.screenWidth * 0.10, height: Device.screenWidth * 0.10).padding(.top)
                }
                .frame(width: Device.screenWidth * 0.12, height: Device.screenHeight * 0.055).foregroundColor(.white)
                .background(.white)
                .cornerRadius(300)
            }
        }
    }
}

struct PickerPets_Previews: PreviewProvider {
    static var previews: some View {
        PickerPets(initalValue: PickerModel(id: UUID(), name: "test", image: "dog"),  items: [], action: {value in })
    }
}

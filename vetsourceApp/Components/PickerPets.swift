//
//  PickerPets.swift
//  vetsourceApp
//
//  Created by Kevin Velasco on 9/5/23.
//

import SwiftUI

struct PickerPets: View {
    @State var selectedStrength: String
    let strengths = ["Mild", "Medium", "Mature"]
    let items: [PickerModel]
    let action: (_ value: PickerModel)-> Void
    
    
    init(items: [PickerModel], action: @escaping (_ value: PickerModel)-> Void) {
        self.selectedStrength = items.count > 0 ? items[0].name : "No items"
        self.items = items
        self.action = action
    }
    
    var body: some View {
        VStack {
            Menu {
                ForEach(items){ item in
                    Button(item.name) {
                        selectedStrength = item.name
                        action(item)
                    }
                }
                
            } label: {
                ZStack {
                    Rectangle()
                        .frame(width: Device.screenWidth * 0.4, height: Device.screenHeight * 0.045).foregroundColor(.white)
                        .overlay(
                            RoundedRectangle(cornerRadius: 5)
                                .stroke(.black.opacity(0.5), lineWidth: 1)
                        )
                    HStack() {
                        Text(selectedStrength).padding(.leading, 10)
                        Spacer()
                        ZStack{
                            Color.gray.opacity(0.2).border(width: 1, edges: [.leading], color: .black.opacity(0.5))
                            Image(systemName: "chevron.down")
                        }.frame(width: Device.screenWidth * 0.1)
                        
                    }
                }.frame(width: Device.screenWidth * 0.4, height: Device.screenHeight * 0.045).foregroundColor(.black)
            }
        }
    }
}

struct PickerPets_Previews: PreviewProvider {
    static var previews: some View {
        PickerPets(items: [], action: {value in })
    }
}

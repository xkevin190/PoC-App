//
//  AutoShip.swift
//  vetsourceApp
//
//  Created by Kevin Velasco on 4/5/23.
//

import SwiftUI

struct AutoShip: View {
    @EnvironmentObject var petModel: PetViewModel
    
    var body: some View {
        ZStack(alignment: .top) {
            Color.white
            VStack {
                HStack() {
                    Text("Shopping for:").foregroundColor(Colors.subtitle)
                    Spacer()
                    PickerPets(items: petModel.getPickerValue(), action:  { value in
                        print(value)
                    })
                }
                .padding(.horizontal)
                .padding(.top, Device.screenHeight * 0.08)
                VStack(alignment: .leading) {
                    Text("AutoShip").font(.largeTitle).padding(.bottom).fontWeight(.semibold).padding(.leading)
                    Text("Schedule regular deliveries right to your front door. Learn more")
                        .padding(.horizontal)
                        .foregroundColor(Colors.subtitle)
                }.padding(.top, Device.screenHeight * 0.03)

                AutoShipCard().padding()
                
            }
            
        }
        .ignoresSafeArea()
        .frame(height: SizeScreens.ScreenHeight)
        .padding(.top, Device.screenHeight * 0.04)
        
    }
}

struct AutoShip_Previews: PreviewProvider {
    static var previews: some View {
        AutoShip().environmentObject(PetViewModel())
    }
}

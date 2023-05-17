//
//  AutoShip.swift
//  vetsourceApp
//
//  Created by Kevin Velasco on 4/5/23.
//

import SwiftUI

struct AutoShip: View {
    @EnvironmentObject var petModel: PetViewModel
    @State private var showToast = false

    
    var body: some View {
        ZStack(alignment: .top) {
            Color.white
            VStack {
                HStack() {
                    Text("Shopping for:").foregroundColor(Colors.subtitle)
                    Spacer()
                    PickerPets(items: petModel.getPickerValue(), action:  {value in
                        
                        petModel.petSelected = value.id
                    })
                }
                .padding(.horizontal)
                .padding(.top, Device.screenHeight * 0.08)
                VStack(alignment: .leading) {
                    Text("AutoShip").font(.largeTitle).padding(.bottom).fontWeight(.semibold).padding(.leading).foregroundColor(.black)
                    Text("Schedule regular deliveries right to your front door. Learn more")
                        .padding(.horizontal)
                        .foregroundColor(Colors.subtitle)
                }.padding(.top, Device.screenHeight * 0.03)
                
                ForEach(petModel.getPetSelected) { product in
                    AutoShipCard(action: {
                        petModel.edit.toggle()
                        petModel.productToEdit = product.id
                        
                    }, product: product).padding()
                }
                
            }
            .background(
                NavigationLink(
                    destination: UpdateDose(product: petModel.getProductToEdit),
                    isActive: $petModel.edit,
                    label: { EmptyView() })
            )
            if petModel.toastShow {
                CustomAlert(action: {
                    withAnimation {
                        petModel.toastShow.toggle()
                        
                    }
                })
                .if(petModel.toastShow) {
                    $0.transition(.move(edge: .bottom))
                }
                .if(!petModel.toastShow) {
                    $0.transition(.move(edge: .top))
                }
            }
        }
        .ignoresSafeArea()
        .frame(height: SizeScreens.ScreenHeight)
        .padding(.top, Device.screenHeight * 0.04)
        .onAppear(){
            petModel.petSelected = petModel.pets[0].id
        }
        
        
    }
}

struct AutoShip_Previews: PreviewProvider {
    static var previews: some View {
        AutoShip().environmentObject(PetViewModel(notification: NotificationModel()))
    }
}

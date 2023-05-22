//
//  AutoShip.swift
//  vetsourceApp
//
//  Created by Kevin Velasco on 4/5/23.
//

import SwiftUI

struct AutoShip: View {
    @ObservedObject var petModel: PetViewModel
    @State private var showToast = false
    @State private var focus = false;
    var petSelected: Pet
    var notification: Bool
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    
    
    var body: some View {
        ZStack(alignment: .top) {
            Color.white
            Image("headerAutoShip").resizable().frame(width: Device.screenWidth * 1, height: Device.screenHeight * 0.18)
            HStack(alignment: .center) {
                
                Button {
                    mode.wrappedValue.dismiss()
                    focus = false
                    petModel.notificationService.notifyRedirect = Redirect(idPet: petSelected.id.uuidString, redirectToProfile: false, redirectToDose: false)
                } label: {
                    Image(systemName: "arrow.left").font(.title).foregroundColor(.white)
                }.opacity(!notification ? 0: 1 )
                
                Spacer()
                Text("AutoShip").font(.title).foregroundColor(.white)
                Spacer()
                if (focus) {
                    if let initialValue = petModel.getInitialPicker(id: petModel.petSelected) {

                        PickerPets(initalValue: initialValue,  items: petModel.getPickerValue(), action:  { value in
                            print("value", value.id)
                            petModel.petSelected = value.id
                        }).offset(y: -Device.screenHeight * 0.002)
                    }
                }
            }
            .padding(.top, Device.screenHeight * 0.063)
            .padding(.horizontal)
            VStack {
                VStack(alignment: .leading) {
                    Text("Schedule regular deliveries right to your front door. Learn more")
                        .padding(.horizontal)
                        .foregroundColor(Colors.subtitle)
                }.padding(.top, Device.screenHeight * 0.03)
                
                if (focus && !petModel.edit) {
                    if let values = petModel.getPet(id: petModel.petSelected.uuidString) {
                        ForEach(values.product, id: \.id) { product in
                            AutoShipCard(action: {
                                petModel.edit.toggle()
                                petModel.productToEdit = product.id
                                
                            }, product: product).padding()
                        }
                    }
                }

            }
            .padding(.top, Device.screenHeight * 0.18)
            .sheet(isPresented: $petModel.edit) {
                UpdateDose(product: petModel.getProductToEdit)
            }
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
        .navigationBarHidden(true)

        .onAppear(){
            petModel.petSelected = petSelected.id
            focus = true;
        }
        .onDisappear() {
            focus = false;
        }
    }
}

struct AutoShip_Previews: PreviewProvider {
    static var previews: some View {
        AutoShip(petModel: PetViewModel(notification: NotificationModel()), petSelected: Pet.preview, notification: true)
    }
}

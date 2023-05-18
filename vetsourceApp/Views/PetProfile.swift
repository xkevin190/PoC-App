//
//  PetProfile.swift
//  vetsourceApp
//
//  Created by Kevin Velasco on 6/5/23.
//

import SwiftUI

struct PetProfile: View {
    var petSelected: Pet?
    
    @EnvironmentObject var petModel: PetViewModel
    
    @State var edit: Bool = false
    
    var body: some View {
        if let pet = petSelected {
            ZStack(alignment: .top) {
                Color.white
                Image("headerProfile").resizable().frame(height: Device.screenHeight * 0.4)
                Image(pet.image).resizable().frame(width: Device.screenWidth * 0.5, height: Device.screenHeight * 0.3).padding(.top, Device.screenHeight * 0.05)
                
                VStack{
                    CardInProfile(pet: pet, action: {
                        edit.toggle()
                    })
                    .padding(.top, Device.screenHeight * 0.25)
                    .padding(.bottom)
                    
                    
                    Button {
                        edit.toggle()
                    } label: {
                        if let fix = petModel.isNecesaryFixSomething {
                            CardInfoProfile(important: fix.important, title: fix.name, secondText: fix.incomingOrder).padding(.bottom)
                        }
                    }
                        
                    
                    if let order = petModel.incomingsOrders  {
                        CardInfoProfile(important: order.important, title: order.name, secondText: order.incomingOrder, third: order.date , fourth: order.time)
                    }
                }
            }
            .ignoresSafeArea()
            .background(
                NavigationLink(
                    destination: EditProfile(pet: pet),
                    isActive: $edit,
                    label: { EmptyView() })
            )
            .onAppear(){
                petModel.petSelected = UUID(uuidString: petModel.notificationService.notifyRedirect.idPet) ?? UUID()
            }
        }
    }
}

struct PetProfile_Previews: PreviewProvider {
    static var previews: some View {
        PetProfile(petSelected: Pet(name: "Mia", age: "10/02/2018", weight: "5", orders: 3, image: "dog", product: [])).environmentObject(PetViewModel(notification: NotificationModel()))
    }
}

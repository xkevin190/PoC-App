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
    @State var focus: Bool = false
    @State var focusEdit: Bool = true
    @Namespace var namespace
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>

    
    func initialView(pet: Pet) -> some View {
        ZStack(alignment: .top) {
            Color.white
            VStack(){
                ZStack(alignment: .top) {
                    Image("headerProfile") .resizable().frame(height: focus ?   SizeScreens.ScreenHeight * 0.32 : SizeScreens.ScreenHeight * 0.45)
                    
                    Image(pet.image)
                        .resizable()
                        .frame(width: Device.screenWidth * 0.5, height: Device.screenHeight * 0.3)
                        .padding(.top, Device.screenHeight * 0.05)
                        .padding(.top, !focus ? Device.screenHeight * 0.4 : 0 )
                        .opacity(!focus ? 0.1 : 1)
                
                    CardInProfile(pet: petModel.getPet(id: pet.id.uuidString), action: {
                        withAnimation {
                            edit.toggle()
                        }
                    })
                    .padding(.top, Device.screenHeight * 0.25)
                }
                .matchedGeometryEffect(id: "profile", in: namespace)
                .padding(.bottom)


                if let fix = petModel.isNecesaryFixSomething {
                    CardInfoProfile(important: fix.important, title: fix.name, secondText: fix.incomingOrder).padding(.bottom).onTapGesture {
                        withAnimation {
                            edit.toggle()
                        }
                    }
                }


                if let order = petModel.incomingsOrders  {
                    CardInfoProfile(important: order.important, title: order.name, secondText: order.incomingOrder, third: order.date , fourth: order.time).offset(x: 0, y: !focus ? -Device.screenHeight * 0.2 : 0)
                }
            }
        }
        .ignoresSafeArea()
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button {
                    withAnimation {
                        mode.wrappedValue.dismiss()
                        focus = false
                        petModel.notificationService.notifyRedirect = Redirect(idPet: "", redirectToProfile: false, redirectToDose: false)
                    }
                } label: {
                    Image(systemName: "arrow.left").font(.title2).foregroundColor(.white)
                }
            }
        }
        .onAppear(){
            petModel.petSelected = petModel.notificationService.notifyRedirect.idPet.count > 0 ? UUID(uuidString: petModel.notificationService.notifyRedirect.idPet)! : petSelected!.id
            print("petSelected", petModel.petSelected)
            withAnimation(.easeInOut(duration: 0.5)) {
                focus = true
            }
        }
    }
    
    
    func sencodView (pet: Pet)-> some View {
        VStack {
            ZStack(alignment: .top) {
                Color.white
                VStack () {
                    ZStack {
                        Image("headerEdit")
                            .resizable()
                            .frame(width: Device.screenWidth * 1, height: Device.screenHeight * 0.40).padding(.top, -Device.screenHeight * 0.15)
                        
                        SmallCard(petModel: petModel, pet: pet).padding(.top, Device.screenHeight * 0.14)
                    }
                    .matchedGeometryEffect(id: "profile", in: namespace)
                    
                   if focusEdit {
                        ZStack {
                           EditSection(text: $petModel.newName, label: "Name", placeholder: petModel.getPet(id: pet.id.uuidString).name, save: {
                               petModel.changeName(id: pet.id)
                           })
                           .padding(.horizontal)
                           .padding(.top, Device.screenHeight * 0.05)
                           
                        }.matchedGeometryEffect(id: "edits", in: namespace)
                   } else {
                       VStack {
                           EditSection(text: $petModel.newName, label: "Name", placeholder: petModel.getPet(id: pet.id.uuidString).name, save: {
                               petModel.changeName(id: pet.id)
                           })
                           .padding(.horizontal)
                           .padding(.top, Device.screenHeight * 0.05)
                           
                           EditSection(text: $petModel.newAge, label: "Birthday", placeholder: petModel.getPet(id: pet.id.uuidString).age, save: {
                               petModel.changeAge(id: pet.id)
                           }).padding(.horizontal)
                           
                           
                           EditSection(text: $petModel.newWeight, label: "Weight", placeholder: petModel.getPet(id: pet.id.uuidString).weight, save: {
                               petModel.changeWeight(id: pet.id)
                           })
                           .padding(.horizontal)
                       }.matchedGeometryEffect(id: "edits", in: namespace)
                   }
                    Spacer()
                }
                .frame(
                    height: Device.screenHeight
                )
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Button {
                            withAnimation {
                                edit = false
                                focusEdit = true
                            }
                        } label: {
                            Image(systemName: "arrow.left").font(.title2).foregroundColor(.white)
                        }
                    }
                }
                .onAppear(){
                    withAnimation(.easeInOut(duration: 0.5)) {
                        focusEdit = false
                    }
                  
                }
            }
        }.ignoresSafeArea()
    }
    
    var body: some View {
        if let pet = petSelected {
            if edit {
                sencodView(pet: pet).navigationBarBackButtonHidden(true).onChange(of: pet.id) { newValue in
                    print("newValue", newValue)
                }
            } else {
                initialView(pet: pet).navigationBarBackButtonHidden(true)
            }
            
        }
    }
    
    struct PetProfile_Previews: PreviewProvider {
        static var previews: some View {
            PetProfile(petSelected: Pet(name: "Mia", age: "10/02/2018", weight: "5", orders: 3, image: "dog", product: [])).environmentObject(PetViewModel(notification: NotificationModel()))
        }
    }
}

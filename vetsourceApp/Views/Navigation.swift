//
//  SwiftUIView.swift
//  vetsourceApp
//
//  Created by Kevin Velasco on 4/5/23.
//

import SwiftUI
import UserNotifications

struct Navigation: View {
    @ObservedObject var navigationModel: NavigationModel
    @ObservedObject  var notificationModel: NotificationModel
    @ObservedObject var PetModel: PetViewModel
    @State var redirectToPrfile = false
    @State var redirectToDose = false

    
    init(notifcation: NotificationModel) {
        notificationModel = notifcation
        navigationModel = NavigationModel()
        PetModel =  PetViewModel(notification: notifcation)
        
        
        notificationModel.notify.append(
            Notify(title: "Update dose", descripton: "Mia’s order needs atention, please review your AutoShip status.", action: "Update Dose", ButtonAction: true, petID: PetModel.pets[0].id)
        )
    }
    
    var body: some View {
        
        NavigationStack {
            VStack{
                VStack {
                    switch navigationModel.selectedTab {
                    case Icons.user.rawValue:
                        Home()
                    case Icons.notification.rawValue:
                        Notification(notification: notificationModel)
                    case Icons.find.rawValue:
                        Find()
                    case Icons.car.rawValue:
                        AutoShip(petSelected: PetModel.pets[0])
                    default:
                        Home()
                    }
                }
                .background() {
                    NavigationLink(
                        destination: PetProfile(petSelected: PetModel.getPet(id: notificationModel.notifyRedirect.idPet)),
                        isActive: $redirectToPrfile,
                        label: { EmptyView() })

                    NavigationLink(
                        destination: AutoShip(petSelected: PetModel.getPet(id: notificationModel.notifyRedirect.idPet)),
                        isActive: $redirectToDose,
                        label: { EmptyView() })
                    
                    NavigationLink(
                        destination: self),
                        isActive: $redirectToDose,
                        label: { EmptyView() })

                }
                .onChange(of: PetModel.notificationService.notifyRedirect.redirectToDose) {newValue in
                    print("new valueDOse", newValue)
                    if(newValue){
                        PetModel.petSelected = UUID(uuidString: PetModel.notificationService.notifyRedirect.idPet) ?? UUID()
                        redirectToDose = true
                    }
                    
                }
                .onChange(of: PetModel.notificationService.notifyRedirect.redirectToProfile) {newValue in
                    print("new prifle", newValue)

                    if(newValue) {
                        PetModel.petSelected = UUID(uuidString: PetModel.notificationService.notifyRedirect.idPet) ?? UUID()
                        redirectToPrfile = true
                    }
                    
                }
                .frame(width: SizeScreens.ScreenWidth , height: SizeScreens.ScreenHeight * 0.8)
                .background(.white)
                .padding(.top, Device.screenHeight * 0.2)
                
                ButtomTab(navigationModel: navigationModel).padding(.bottom, Device.screenHeight * 0.1).shadow(color: .black.opacity(0.3), radius: 3)
            }
        }
        .environmentObject(PetModel)
        .onAppear() {
            notificationModel.requestPermision()
            
        }
    }
    
    
    
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        Navigation(notifcation: NotificationModel())
    }
}

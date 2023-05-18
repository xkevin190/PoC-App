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
                        isActive: $notificationModel.notifyRedirect.redirectToProfile,
                        label: { EmptyView() })
                    
                    NavigationLink(
                        destination: AutoShip(petSelected: PetModel.getPet(id: notificationModel.notifyRedirect.idPet)),
                        isActive: $notificationModel.notifyRedirect.redirectToDose,
                        label: { EmptyView() })
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

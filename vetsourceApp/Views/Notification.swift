//
//  Notification.swift
//  vetsourceApp
//
//  Created by Kevin Velasco on 4/5/23.
//

import SwiftUI

struct Notification: View {
    
    @ObservedObject var notification: NotificationModel;
    @EnvironmentObject var petModel: PetViewModel
    
    var body: some View {
        ZStack {
            Color.white
            
            VStack(alignment: .leading) {
                Text("Notifications").foregroundColor(.black).padding(.horizontal).font(.largeTitle)
                
                ScrollView {
                    ForEach(notification.notify){ value in
                        NotificationCard(title: value.title,
                                         subtitle: value.descripton, button: true, titleButon: value.action, action: {
                            
                            if(value.action == "Go to Pet Profile") {
                                self.notification.notifyRedirect.idPet = value.petID.uuidString
                                self.notification.notifyRedirect = Redirect(idPet: value.petID.uuidString, redirectToProfile: true, redirectToDose: false)
                            } else {
                                self.notification.notifyRedirect.idPet = value.petID.uuidString
                                self.notification.notifyRedirect = Redirect(idPet: value.petID.uuidString, redirectToProfile: false, redirectToDose: true)
                            }
                            
                            
                        }).padding(.bottom)
                    }
                }.padding(.bottom, Device.screenHeight * 0.2)
            }
        }
        .ignoresSafeArea()
        .frame(height: SizeScreens.ScreenHeight)
        .padding(.top, Device.screenHeight * 0.2)
    }
}

struct Notification_Previews: PreviewProvider {
    static var previews: some View {
        Notification(notification: NotificationModel())
    }
}

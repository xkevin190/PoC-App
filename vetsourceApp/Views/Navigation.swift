//
//  SwiftUIView.swift
//  vetsourceApp
//
//  Created by Kevin Velasco on 4/5/23.
//

import SwiftUI
import UserNotifications

struct Navigation: View {
    @ObservedObject var navigationModel = NavigationModel()
    @ObservedObject var PetModel = PetViewModel()
    
    @ObservedObject var notificationModel = NotificationModel()
    
    
    var body: some View {
        NavigationStack {
            VStack{
                VStack {
                    switch navigationModel.selectedTab {
                    case Icons.user.rawValue:
                        Home()
                    case Icons.notification.rawValue:
                        Notification()
                    case Icons.find.rawValue:
                        Find()
                    case Icons.car.rawValue:
                        AutoShip()
                    default:
                        Home()
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
        Navigation()
    }
}

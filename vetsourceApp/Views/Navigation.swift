//
//  SwiftUIView.swift
//  vetsourceApp
//
//  Created by Kevin Velasco on 4/5/23.
//

import SwiftUI

struct Navigation: View {
    @ObservedObject var navigationModel = NavigationModel()
    var body: some View {
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
            .frame(width: SizeScreens.ScreenWidth , height: SizeScreens.ScreenHeight * 0.9)
            ButtomTab(navigationModel: navigationModel)
        }
        .shadow(color: .black.opacity(0.3), radius: 3)
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        Navigation()
    }
}

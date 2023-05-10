//
//  NavigationViewModel.swift
//  vetsourceApp
//
//  Created by Kevin Velasco on 4/5/23.
//

import Foundation



class NavigationModel: ObservableObject {
    @Published var selectedTab: String = "user"
    
    func titleHeader (selectedTab: String)-> String {
        switch selectedTab {
        case Icons.user.rawValue:
           return "Your Pets"
        case Icons.notification.rawValue:
           return  "Notification"
        case Icons.find.rawValue:
            return  "Find"
        case Icons.car.rawValue:
            return "AutoShip"
        default:
            return "Your Pets"
        }
    }
        
}

//
//  Notification.swift
//  vetsourceApp
//
//  Created by Kevin Velasco on 4/5/23.
//

import SwiftUI

struct Notification: View {
    var body: some View {
        VStack {
            ScrollView {
                NotificationCard(title: "Dose update required",
                                 subtitle: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.", button: true, titleButon: "Action Button", action: {})
   
                NotificationCard(title: "Dose update required",
                                 subtitle: "Mia’s order needs atention, please review your AutoShip status.")
                
                NotificationCard(title: "Action with Button", subtitle: "Mia’s order needs atention, please review your AutoShip status.", button: true, titleButon: "Action Button", action: {})
                
                NotificationCard(title: "Dose update required",
                                 subtitle: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.")
            }
        }
        .padding(.top,SizeScreens.ScreenHeight * 0.044 )
    }
}

struct Notification_Previews: PreviewProvider {
    static var previews: some View {
        Notification()
    }
}

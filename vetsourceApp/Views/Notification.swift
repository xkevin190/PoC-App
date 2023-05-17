//
//  Notification.swift
//  vetsourceApp
//
//  Created by Kevin Velasco on 4/5/23.
//

import SwiftUI

struct Notification: View {
    
    var natification: NotificationModel;
    var body: some View {
        ZStack {
            Color.white
           
            VStack(alignment: .leading) {
                Text("Notifications").foregroundColor(.black).padding(.horizontal).font(.largeTitle)

                ScrollView {
                    ForEach(natification.notify){ value in
                        NotificationCard(title: value.title,
                                         subtitle: value.descripton, button: true, titleButon: value.action, action: {}).padding(.bottom)
                    }
                }
            }
        }
        .ignoresSafeArea()
        .frame(height: SizeScreens.ScreenHeight)
        .padding(.top, Device.screenHeight * 0.2)
    }
}

struct Notification_Previews: PreviewProvider {
    static var previews: some View {
        Notification(natification: NotificationModel())
    }
}

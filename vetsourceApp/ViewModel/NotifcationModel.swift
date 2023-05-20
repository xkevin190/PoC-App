//
//  NotifcationModel.swift
//  vetsourceApp
//
//  Created by Kevin Velasco on 15/5/23.
//

import Foundation
import UserNotifications
import UIKit


class NotificationModel: NSObject, ObservableObject, UNUserNotificationCenterDelegate {
   var permision:Bool = false
   @Published var  notify: [Notify] = []
   @Published var notifyRedirect = Redirect()
    
    
    
    func requestPermision () {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound ]) {
            sucess, error in
            
            if sucess {
                self.permision = true
                UNUserNotificationCenter.current().delegate = self

            } else if let error = error {
                print(error.localizedDescription)
            }
        }
    }
    
    
    
    func sendLocalNotification (title: String, subtitle: String, action: String, petId: UUID) {
        let content = UNMutableNotificationContent()
        
        content.title = title
        content.subtitle = subtitle
        content.sound = UNNotificationSound.default
        content.userInfo = ["action": action, "id": petId.uuidString ]

         
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
        
        
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)

        
        UNUserNotificationCenter.current().add(request)
        
        let actionMessage: String = action == "toProfile" ? "Go to Pet Profile" : "Update Dose"
        notify.append(
            Notify(title: title, descripton: subtitle, action: actionMessage, ButtonAction: true, petID: petId )
        )
    }
    
    
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        
        let userInfo = response.notification.request.content.userInfo
        
        // Check if the notification was triggered by a user click
        if response.actionIdentifier == UNNotificationDefaultActionIdentifier {
            let _idPet = userInfo["id"] as! String
            if(userInfo["action"] as! String == "toProfile") {
                notifyRedirect = Redirect(idPet: _idPet, redirectToProfile: true)
            } else {
                notifyRedirect = Redirect(idPet: _idPet, redirectToDose: true  )
            }
        }
        
        completionHandler()
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        
        completionHandler([.banner, .sound])
    }
    
}

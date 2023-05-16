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

    
    
    func sendLocalNotification () {
        let content = UNMutableNotificationContent()
        
        content.title = "firts test of notification"
        content.subtitle = "they look hungry"
        content.sound = UNNotificationSound.default
        content.userInfo = ["action": "openApp"]

         
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
        
        
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)

        
        UNUserNotificationCenter.current().add(request)
    }
    
    
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        
        let userInfo = response.notification.request.content.userInfo
        
        // Check if the notification was triggered by a user click
        if response.actionIdentifier == UNNotificationDefaultActionIdentifier {
            print("executed!!!", userInfo)
        }
        
        completionHandler()
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        
        completionHandler([.banner, .sound])
    }
    
}

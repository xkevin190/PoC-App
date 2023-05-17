//
//  ContentView.swift
//  vetsourceApp
//
//  Created by Kevin Velasco on 4/5/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        Navigation(notifcation: NotificationModel())
    }
}


struct SizeScreens {
    static var ScreenWidth = UIScreen.main.bounds.width
    static var ScreenHeight =  UIScreen.main.bounds.height
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

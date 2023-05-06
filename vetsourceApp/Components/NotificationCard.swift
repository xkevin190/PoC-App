//
//  NotificationCard.swift
//  vetsourceApp
//
//  Created by Kevin Velasco on 5/5/23.
//

import SwiftUI

struct NotificationCard: View {
    var title: String;
    var subtitle: String;
    
    var button: Bool = false
    var action: (()-> Void)? = nil;
    var buttonTitle: String = ""
    
    init(title: String, subtitle: String) {
        self.title = title
        self.subtitle = subtitle
    }
    
    
    init(title: String, subtitle: String, button: Bool, titleButon: String, action: @escaping ()-> Void) {
        self.title = title
        self.subtitle = subtitle
        self.action = action
        self.button = button
        self.buttonTitle = titleButon
    }
    
    var body: some View {
        VStack() {
            VStack {
                HStack {
                    Text(title)
                        .font(.system(size: 25))
                        .fontWeight(.bold)
                        .foregroundColor(Colors.title)
                        .scaledToFill()
                        .minimumScaleFactor(0.5)
                    
                    Spacer()
                    
                }
                .padding(.top)
                
                
                HStack {
                    Text(subtitle)
                        .font(.system(size: 20))
                        .fontWeight(.regular)
                        .foregroundColor(Colors.subtitle)
                        .minimumScaleFactor(0.5)
                        .multilineTextAlignment(.leading)
                    Spacer()
                }
                .padding(.top, SizeScreens.ScreenHeight * 0.001)
                .padding(.bottom, SizeScreens.ScreenHeight * 0.01)
                
                if button {
                    ButtonAction(buttonColor: Color.white, borderColor: Color.black, textColor: Colors.title, text: buttonTitle, action: {
                        print("aqui!!")
                    })
                        .padding(.bottom, SizeScreens.ScreenHeight * 0.01)
                }
            }.padding()
            
            
        }
        .cornerRadius(10)
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color(hex: "#5E6261"), lineWidth: 0.5)
        )
        .padding(.horizontal)
    }
}

struct NotificationCard_Previews: PreviewProvider {
    static var previews: some View {
        NotificationCard(title: "Dose update required",
                         subtitle: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.")
        
        
        NotificationCard(title: "Dose update required",
                         subtitle: "Mia’s order needs atention, please review your AutoShip status.")
        
        NotificationCard(title: "Action with Button", subtitle: "Mia’s order needs atention, please review your AutoShip status.", button: true, titleButon: "Action Button", action: {})
    }
}

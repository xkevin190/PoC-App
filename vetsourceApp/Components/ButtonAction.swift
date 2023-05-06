//
//  Button.swift
//  vetsourceApp
//
//  Created by Kevin Velasco on 5/5/23.
//

import SwiftUI

struct ButtonAction: View {
    var buttonColor: Color
    var borderColor: Color
    var textColor: Color
    var text: String
    
    var action: ()-> Void
    var body: some View {
        
        
        VStack {
            Button {
                action()
            } label: {
                HStack {
                    Spacer()
                    Text(text)
                        .font(.system(size: 17))
                        .foregroundColor(textColor)
                        .fontWeight(.medium)
                        .scaledToFill()
                        .minimumScaleFactor(0.5)
                    Spacer()
                }
                .padding()
                .background(buttonColor)
                .cornerRadius(10)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(borderColor, lineWidth: 1)
                    
                )
            }
        }
    }
}

struct Button_Previews: PreviewProvider {
    static var previews: some View {
        ButtonAction(buttonColor: Color.white, borderColor: Color.black, textColor: Colors.title, text: "View suggestion", action: {})
        ButtonAction(buttonColor: Colors.secondary, borderColor: Colors.secondary, textColor: Color.white, text: "update dose", action: {})
    }
}

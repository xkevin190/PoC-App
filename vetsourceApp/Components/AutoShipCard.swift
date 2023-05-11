//
//  AutoShipCard.swift
//  vetsourceApp
//
//  Created by Kevin Velasco on 9/5/23.
//

import Foundation
import SwiftUI


struct AutoShipCard: View {
    var action: ()-> Void
    var body: some View {
        VStack(alignment: .leading) {
            ZStack {
                Rectangle()
                    .frame(width: Device.screenWidth * 0.5, height: Device.screenWidth * 0.1)
                    .foregroundColor(Color(hex:" #FFF1C6"))
                HStack {
                    Circle().frame(width: 10, height: 10).foregroundColor(Color(hex: "#E9B820"))
                    Text("Dose update required")
                        .font(.system(size: 16))
                        .foregroundColor(Color(hex: "#956C06"))
                        .scaledToFill()
                        .minimumScaleFactor(0.5)
                        .fontWeight(.medium)
                }
                
            }
            .frame(width: Device.screenWidth * 0.5, height: Device.screenWidth * 0.1, alignment: .bottom)
            .cornerRadius(10)
            
            Text("Next AutoShip: 10/08/2022")
                .padding(.bottom, Device.screenHeight * 0.001)
                .font(.system(size: 23))
                .foregroundColor(Colors.title)
                .scaledToFill()
                .minimumScaleFactor(0.5)
                .fontWeight(.semibold)
            
            Text("Buddy")
                .fontWeight(.semibold)
                .font(.system(size: 18))
            
            HStack() {
                Image("dog")
                
                VStack(alignment: .leading) {
                    Text("ROYAL CANIN VETERNIARY DIET Canine Gastrointestinal Low Fat Dry Dog Food")
                        .foregroundColor(Color(hex: "#463A70"))
                        .underline()
                        .padding(.bottom, Device.screenHeight  * 0.009)
                    
                    Text("Size").foregroundColor(Colors.subtitle).padding(.bottom, Device.screenHeight  * 0.001)
                    
                    Text("4-10 lbs (Orange)").foregroundColor(.black).fontWeight(.medium).padding(.bottom, Device.screenHeight  * 0.001)
                    
                    Text("Packaging").foregroundColor(Colors.subtitle).fontWeight(.medium).padding(.bottom, Device.screenHeight  * 0.001)
                    
                    Text("3 Chewables").foregroundColor(.black).fontWeight(.medium)
                    

                }
            }
            ButtonAction(buttonColor: .white, borderColor: .black, textColor: .black, text: "View suggestion", action: {
                action()
            })
        }
        .frame(width: Device.screenWidth * 0.8)
        .cornerRadius(10)
        .padding()
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(.black.opacity(0.3), lineWidth: 1)
            
        )
    }
}


struct AutoShipCard_Previews: PreviewProvider {
    static var previews: some View {
        AutoShipCard(action: {})
    }
}

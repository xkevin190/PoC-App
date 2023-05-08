//
//  CardInProfile.swift
//  vetsourceApp
//
//  Created by Kevin Velasco on 8/5/23.
//

import SwiftUI

struct CardInProfile: View {
    var pet: Pet
    var action: ()-> Void;
    var body: some View {
        VStack {
            VStack {
                HStack() {
                    Text(pet.name)
                        .font(.system(size: 25))
                        .fontWeight(.bold)
                        .foregroundColor(Colors.title)
                        .scaledToFill()
                        .minimumScaleFactor(0.5)
                    
                    Spacer()
                    HStack {
                        Image("cake")
                        
                        Text(pet.age)
                            .font(.system(size: 16))
                            .fontWeight(.regular)
                            .foregroundColor(Colors.subtitle)
                            .scaledToFill()
                            .minimumScaleFactor(0.5)
                        
                    }.padding(.top, -SizeScreens.ScreenHeight * 0.01)
                }
                .padding(.horizontal)
                .padding(.vertical)
                
                HStack() {
                    Text("Active orders: \(pet.orders) ")
                        .fontWeight(.regular)
                        .foregroundColor(Colors.subtitle)
                        .scaledToFill()
                        .minimumScaleFactor(0.5)
                                        
                    Spacer()
                    
                    Text("Weight: \(pet.weight)")
                        .font(.system(size: 16))
                        .fontWeight(.regular)
                        .foregroundColor(Colors.subtitle)
                        .scaledToFill()
                        .minimumScaleFactor(0.5)
                    
                }
                .padding(.horizontal)
                .padding(.bottom)
                
                ButtonAction(buttonColor: .white, borderColor: Colors.title, textColor: Colors.title, text: "Edit Profile", action: {
                    action()
                })
                .padding(.horizontal)
                .padding(.bottom)
            }
            
        }
        
        .frame(width: SizeScreens.ScreenWidth * 0.9)
        .frame(minHeight: SizeScreens.ScreenHeight * 0.15)
        .background(.white)
        .cornerRadius(15)
        .shadow(color: .black.opacity(0.2), radius: 7, x: 0, y: 0)
    }
}

struct CardInProfile_Previews: PreviewProvider {
    static var previews: some View {
        CardInProfile(pet: Pet.preview, action: {})
    }
}

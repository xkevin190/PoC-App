//
//  SmallCard.swift
//  vetsourceApp
//
//  Created by Kevin Velasco on 8/5/23.
//

import SwiftUI

struct SmallCard: View {
    var pet: Pet
    var body: some View {
        VStack {
            HStack {
                VStack(alignment: .leading) {
                    
                    Text(pet.name)
                        .font(.system(size: 25))
                        .fontWeight(.bold)
                        .foregroundColor(Colors.title)
                        .scaledToFill()
                        .minimumScaleFactor(0.5)
                
                    
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
                .padding(.top, SizeScreens.ScreenHeight * 0.02)
                .padding(.bottom, SizeScreens.ScreenHeight * 0.019 )
                Spacer()
                
                VStack {
                    Image(pet.image)
                        .resizable()
                        .scaledToFit()
                        .frame(width: SizeScreens.ScreenWidth * 0.2, height: SizeScreens.ScreenHeight * 0.1)
                        .padding(.bottom, -SizeScreens.ScreenHeight * 0.03)
                        .padding(.trailing)
                       
                }
            }
            
        }
        
        .frame(width: SizeScreens.ScreenWidth * 0.9)
        .frame(minHeight: SizeScreens.ScreenHeight * 0.1)
        .background(.white)
        .cornerRadius(15)
        .shadow(color: .black.opacity(0.2), radius: 7, x: 0, y: 0)
        
    }
}

struct SmallCard_Previews: PreviewProvider {
    static var previews: some View {
        SmallCard(pet: Pet.preview)
    }
}

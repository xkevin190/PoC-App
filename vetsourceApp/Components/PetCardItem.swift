//
//  PetCardItem.swift
//  vetsourceApp
//
//  Created by Kevin Velasco on 4/5/23.
//

import Foundation
import SwiftUI

struct PetCardItem: View {
    var title: String
    var date: String
    var orders: Int
    var image: String
    
    var body: some View {
        
        VStack {
            HStack {
                VStack(alignment: .leading) {
                    
                    Text(title)
                        .font(.system(size: 25))
                        .fontWeight(.bold)
                        .foregroundColor(Colors.title)
                        .scaledToFill()
                        .minimumScaleFactor(0.5)
                
                    
                    HStack {
                        Image("cake")
                          
                        Text(date)
                            .font(.system(size: 16))
                            .fontWeight(.regular)
                            .foregroundColor(Colors.subtitle)
                            .scaledToFill()
                            .minimumScaleFactor(0.5)
                        
                    }.padding(.top, -SizeScreens.ScreenHeight * 0.01)
                        
                    
                    Text("Active orders: \(orders) ")
                        .fontWeight(.regular)
                        .foregroundColor(Colors.subtitle)
                        .scaledToFill()
                        .minimumScaleFactor(0.5)
                        .padding(.top,  SizeScreens.ScreenHeight * 0.015)
                    
                }
                .padding(.horizontal)
                .padding(.top, SizeScreens.ScreenHeight * 0.02)
                .padding(.bottom, SizeScreens.ScreenHeight * 0.012 )
                Spacer()
                
                VStack {
                    Image(image)
                        .resizable()
                        .scaledToFit()
                        .frame(width: SizeScreens.ScreenWidth * 0.3, height: SizeScreens.ScreenHeight * 0.17)
                        .padding(.bottom, -SizeScreens.ScreenHeight * 0.03)
                        .padding(.trailing)
                       
                }
            }
            
        }
        
        .frame(width: SizeScreens.ScreenWidth * 0.9)
        .frame(minHeight: SizeScreens.ScreenHeight * 0.15)
        .background(.white)
        .cornerRadius(15)
        .shadow(color: .black.opacity(0.2), radius: 7, x: 0, y: 0)
        
    }
}

struct PetCardItem_Previews: PreviewProvider {
    static var previews: some View {
        PetCardItem(title: "Mia", date: "10/02/2018", orders: 3, image: "dog")
    }
}

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
    
    var product: Product
    @State var isActive = false;
    
    var body: some View {
        VStack(alignment: .leading) {
            ZStack(alignment: .leading) {
                Rectangle()
                    .frame(width: isActive ? Device.screenWidth * 0.2: Device.screenWidth * 0.5, height: Device.screenWidth * 0.1)
                    .foregroundColor(isActive ? Color(hex: "#E1F6D1") :  Color(hex:" #FFF1C6"))
               
                
                HStack(alignment: .center) {
                        Circle().frame(width: 10, height: 10).foregroundColor(isActive ? .green : Color(hex: "#E9B820"))
                        Text(isActive ? "Active": "Dose update required")
                            .font(.system(size: 16))
                            .foregroundColor(isActive ? Color(hex: "#377309") : Color( hex: "#956C06"))
                            .scaledToFill()
                            .minimumScaleFactor(0.5)
                            .fontWeight(.medium)
                    }
                .padding(.leading, Device.screenWidth * 0.025)
                    
            }
            .cornerRadius(10)
            .frame(width: isActive ? Device.screenWidth * 0.2 : Device.screenWidth * 0.5, height: Device.screenWidth * 0.1, alignment: .bottom)
            
            
            Text("Next AutoShip: \(product.nextAutShip)")
                .padding(.bottom, Device.screenHeight * 0.001)
                .font(.system(size: 23))
                .foregroundColor(Colors.title)
                .scaledToFill()
                .minimumScaleFactor(0.5)
                .fontWeight(.semibold)
            
            if isActive {
                ViewisActive
            }
            
            
            Text("Buddy")
                .fontWeight(.semibold)
                .font(.system(size: 18))
            
            HStack(alignment: .top) {
                Image(product.image).resizable().frame(width: Device.screenWidth * 0.2, height: Device.screenWidth * 0.2)
                
                VStack(alignment: .leading) {
                    Text(product.name)
                        .foregroundColor(Color(hex: "#463A70"))
                        .underline()
                        .padding(.bottom, Device.screenHeight  * 0.009)
                    
                    Text("Strength / Size").foregroundColor(Colors.subtitle).padding(.bottom, Device.screenHeight  * 0.001)
                    
                    Text(product.size).foregroundColor(.black).fontWeight(.medium).padding(.bottom, Device.screenHeight  * 0.001)
                    
                    Text("Packaging").foregroundColor(Colors.subtitle).fontWeight(.medium).padding(.bottom, Device.screenHeight  * 0.001)
                    
                    Text(product.pakage).foregroundColor(.black).fontWeight(.medium)
                }
            }
            
            if !isActive {
                ButtonAction(buttonColor: .white, borderColor: .black, textColor: .black, text: "View suggestion", action: {
                    action()
                })
            }
        }
        .frame(width: Device.screenWidth * 0.8)
        .cornerRadius(10)
        .padding()
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(.black.opacity(0.3), lineWidth: 1)
            
        )
        .onAppear() {
            isActive = product.productStatus.currentStatus == status.updateRequired ? false : true;
        }
    }
    
    
    
    var ViewisActive: some View {
        
        VStack(alignment: .leading) {
            
            Text("Frecuency: \(product.frecuency)").foregroundColor(.black).fontWeight(.medium).padding(.bottom, Device.screenHeight  * 0.002)
            
            Text("Upcoming order dates").foregroundColor(.black).fontWeight(.medium).padding(.bottom, Device.screenHeight  * 0.002)
            
            HStack {
                Text("Jun 25 ").foregroundColor(Colors.subtitle)
                Divider()
                Text("July 25 ").foregroundColor(Colors.subtitle)
                Divider()
                Text("Aug 25 ").foregroundColor(Colors.subtitle)
                Divider()
                Text("Sep 25 ").foregroundColor(Colors.subtitle)
                Divider()
                Text("Oct 25 ").foregroundColor(Colors.subtitle)
            }
            .frame(height: Device.screenHeight * 0.03)
            .padding(.vertical, Device.screenHeight * 0.01)
            
            ButtonAction(buttonColor: .white, borderColor: .black, textColor: .black, text: "Edit autoShip", action: {})
            
            Divider().padding(.top, Device.screenHeight * 0.007)

        }
    }
}





struct AutoShipCard_Previews: PreviewProvider {
    static var previews: some View {
        AutoShipCard(action: {}, product: Product(name: "ROYAL CANIN VETERNIARY DIET Canine Gastrointestinal Low Fat Dry Dog Food", quantity: 1, size: "4-10 lbs (Orange)", pakage: "3 Chewables", image: "dog", productStatus: ProductStatus(currentStatus: status.active, reason: "", nexQuantity: 2),nextAutShip: "25/05/2023",frecuency: "montly"))
    }
}

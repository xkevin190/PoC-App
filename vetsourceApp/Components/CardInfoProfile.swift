//
//  CardInfoProfile.swift
//  vetsourceApp
//
//  Created by Kevin Velasco on 16/5/23.
//

import SwiftUI

struct CardInfoProfile: View {
    var important: Bool = false
    var title: String;
    var secondText: String?
    var third: String?
    var fourth: String?
    
    var body: some View {
        
        VStack {
            
            if important {
                VStack {
                    VStack {
                        Text("Important")
                            .padding(.horizontal, 10)
                            .padding(.vertical, 10)
                            .foregroundColor(.black)
                    }
                    .background(Color(hex: "FF7571"))
                    .padding(.bottom, 5)
                }
                .roundedCorner(10, corners: [.topLeft, .topRight])
                .frame(width: Device.screenWidth * 0.8, alignment: .leading)
                .padding(.bottom, -12)
            }
    
            VStack() {
                VStack(alignment: .leading) {
                    Text(title)
                        .fontWeight(.bold)
                        .font(.system(size: 25))
                        .foregroundColor(.black)
                        .padding(.bottom, 1)
                        .padding(.top, fourth == nil ? 0 : 20)
                    
                    if secondText != nil {
                        Text(secondText!)
                            .foregroundColor(Colors.subtitle)
                            .multilineTextAlignment(.leading)
                            .padding(.bottom, 1)
                            .font(.system(size: 17))
                            
                    }
                    
                    if third != nil {
                        Text(third!)
                            .foregroundColor(Colors.subtitle)
                            .padding(.bottom, 1)
                            .font(.system(size: 17))
                    }
                    
                    if fourth != nil {
                        Text(fourth!)
                            .foregroundColor(Colors.subtitle)
                            .padding(.bottom, 20)
                            .font(.system(size: 17))
                    }
                    
                }
                .frame(width: Device.screenWidth * 0.8, alignment: .leading)
                .padding(.horizontal)
            }
            .frame(minHeight: Device.screenHeight * 0.15)
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(important ? .red.opacity(0.5) : .black.opacity(0.2)  , lineWidth: 2)
            )
        }
    }
}

struct CardInfoProfile_Previews: PreviewProvider {
    static var previews: some View {
        CardInfoProfile(important: true, title: "Fix weight", secondText: "Product Name", third: "vet name", fourth: "time")
        
        CardInfoProfile(important: false, title: "Incoming order", secondText: "Product name ", third: "MM/DD/YYYY")
        
    }
}

//
//  PetProfile.swift
//  vetsourceApp
//
//  Created by Kevin Velasco on 6/5/23.
//

import SwiftUI

struct PetProfile: View {
    var body: some View {
        ZStack(alignment: .top) {
            Color.white
            Image("headerProfile").resizable().frame(height: Device.screenHeight * 0.4)
            Image("dog").resizable().frame(width: Device.screenWidth * 0.5, height: Device.screenHeight * 0.3).padding(.top, Device.screenHeight * 0.05)
        }
        .ignoresSafeArea()
    }
}

struct PetProfile_Previews: PreviewProvider {
    static var previews: some View {
        PetProfile()
    }
}

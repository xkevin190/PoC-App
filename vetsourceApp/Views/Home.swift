//
//  Home.swift
//  vetsourceApp
//
//  Created by Kevin Velasco on 4/5/23.
//

import SwiftUI

struct Home: View {
    @EnvironmentObject var petModel: PetViewModel
    
    var body: some View {
        
        ZStack(alignment: .top) {
            Color.white
            Image("HeaderHome").resizable().frame(height: SizeScreens.ScreenHeight * 0.4)
            VStack {
                ScrollView {
                    ForEach(petModel.pets) { pet in
                        NavigationLink(destination: PetProfile(petSelected: pet), label: {
                            PetCardItem(title: pet.name, date: pet.age, orders: pet.orders, image: pet.image).padding(.top)
                        }).environmentObject(petModel)
                    }
                }
                Spacer()
            }
            .frame(height: SizeScreens.ScreenHeight * 0.91)
            .safeAreaInset(edge: .top){}
        }
        .ignoresSafeArea()
        .frame(height: SizeScreens.ScreenHeight)
        .padding(.top, Device.screenHeight * 0.05)
        
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home().environmentObject(PetViewModel())
    }
}

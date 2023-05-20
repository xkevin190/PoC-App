//
//  Home.swift
//  vetsourceApp
//
//  Created by Kevin Velasco on 4/5/23.
//

import SwiftUI

struct Home: View {
    @EnvironmentObject var petModel: PetViewModel
    @State var bound: Bool = false
    @State var fall: Bool = false
    var body: some View {
        
        ZStack(alignment: .top) {
            Color.white
            Image("HeaderHome").resizable().frame(height: SizeScreens.ScreenHeight * 0.4)
            VStack(alignment: .leading) {
                Text("Your pets").font(.largeTitle).foregroundColor(.white).fontWeight(.bold)
                    .offset(y: fall ? 10: -200)
                    .offset(y: bound ? 0 : -10)
                Image("titleExtra").resizable().frame(width: Device.screenWidth * 0.4, height: 40).padding(.top, -Device.screenHeight * 0.03)
                ScrollView {
                    ForEach(petModel.pets) { pet in
                        NavigationLink(destination: PetProfile(petSelected: pet), label: {
                            PetCardItem(title: pet.name, date: pet.age, orders: pet.orders, image: pet.image).padding(.top)
                        }).environmentObject(petModel)
                    }
                }
                Spacer()
            }
            .frame(height: SizeScreens.ScreenHeight * 0.95)
            .safeAreaInset(edge: .top){}
        }
        .ignoresSafeArea()
        .frame(height: SizeScreens.ScreenHeight)
        .padding(.top, Device.screenHeight * 0.05)
        .onAppear() {
            withAnimation(.linear(duration: 0.3)){
                fall = true
            }
            
            withAnimation(.interpolatingSpring(stiffness: 400, damping: 5, initialVelocity: 10).delay(0.3) ) {
                bound = true
            }
        }
        .onDisappear() {
            fall = false
            bound = false
        }
        
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home().environmentObject(PetViewModel(notification: NotificationModel()))
    }
}

//
//  Home.swift
//  vetsourceApp
//
//  Created by Kevin Velasco on 4/5/23.
//

import SwiftUI

struct Home: View {
    
    var body: some View {
        NavigationView {
            ZStack(alignment: .top) {
                Color.white
                Image("headerHome").resizable().frame(height: SizeScreens.ScreenHeight * 0.4)
                
                VStack {
                    ScrollView {
                        
                        NavigationLink(destination: PetProfile(), label: {
                            PetCardItem(title: "Mia", date: "10/02/2018", orders: 3, image: "dog").padding(.top, 40)
                        })
                        
                        
                        NavigationLink(destination: PetProfile(), label: {
                            PetCardItem(title: "Daisy", date: "11/03/2020", orders: 3, image: "cat").padding(.top)

                        })
                            
                        NavigationLink(destination: PetProfile(), label: {
                            PetCardItem(title: "Poppy", date: "01/02/2019", orders: 3, image: "dog2").padding(.top)
                        })
                    }
                    
                    Spacer()
                    
                }
                .frame(height: SizeScreens.ScreenHeight * 0.91)
                .safeAreaInset(edge: .top){}
            }
            .ignoresSafeArea()
            .navigationTitle("Your pets")
            .frame(height: SizeScreens.ScreenHeight)
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}

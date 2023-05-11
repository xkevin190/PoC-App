//
//  UpdateDose.swift
//  vetsourceApp
//
//  Created by Kevin Velasco on 10/5/23.
//

import SwiftUI

struct UpdateDose: View {
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    
    var body: some View {
        ZStack(alignment: .top) {
            Color.white
            ScrollView {
                VStack(alignment: .leading) {
                    HStack {
                        Text("View suggestion").fontWeight(.medium).font(.title3)
                        Spacer()
                        Button {
                            mode.wrappedValue.dismiss()
                        } label: {
                            Image(systemName: "xmark").fontWeight(.medium).padding(.trailing).foregroundColor(.black)
                        }
                        
                    }.padding(.bottom, Device.screenHeight * 0.02)
                    
                    
                    Text("Your pet’s weight was changed in their pet profile, and your product needs a dose update to ensure the AutoShip is sent on time.")
                        .foregroundColor(Colors.subtitle)
                    
                    
                    Text("Your previous dose was:").font(.system(size: 18)).fontWeight(.semibold).padding(.top, Device.screenHeight * 0.01)
                    
                    VStack {
                        HStack(alignment: .top) {
                            Image("image38")
                            
                            VStack(alignment: .leading) {
                                
                                Text("NexGard Chewables")
                                    .padding(.bottom, Device.screenHeight * 0.03)
                                    .padding(.top)
                                    .foregroundColor(Colors.subtitle)
                                
                                Text("Size").foregroundColor(Colors.subtitle).fontWeight(.medium).padding(.bottom, Device.screenHeight  * 0.001)
                                
                                Text("4-10 lbs (Orange)").foregroundColor(.black).fontWeight(.medium).padding(.bottom, Device.screenHeight  * 0.001)
                                Text("Packaging").foregroundColor(Colors.subtitle).fontWeight(.medium).padding(.bottom, Device.screenHeight  * 0.001)
                                
                                Text("3 Chewables").foregroundColor(.black).fontWeight(.medium).padding(.bottom, Device.screenHeight  * 0.001)
                                Text("Quantity").foregroundColor(Colors.subtitle).fontWeight(.medium).padding(.bottom, Device.screenHeight  * 0.001)
                                Text("1")
                            }
                        }
                        
                        Text("Your dose will be updated to:").font(.system(size: 18)).fontWeight(.semibold)
                        
                        HStack(alignment: .top) {
                            Image("image38")
                            VStack(alignment: .leading) {
                                
                                Text("NexGard Chewables")
                                    .padding(.bottom, Device.screenHeight * 0.022)
                                    .padding(.top)
                                    .foregroundColor(Colors.subtitle)
                                
                                Text("Size").foregroundColor(Colors.subtitle).fontWeight(.medium).padding(.bottom, Device.screenHeight  * 0.001)
                                Text("4-10 lbs (Orange)").foregroundColor(.black).fontWeight(.medium).padding(.bottom, Device.screenHeight  * 0.001)
                                
                                Text("Packaging").foregroundColor(Colors.subtitle).fontWeight(.medium).padding(.bottom, Device.screenHeight  * 0.001)
                                
                                Text("3 Chewables").foregroundColor(.black).fontWeight(.medium).padding(.bottom, Device.screenHeight  * 0.001)
                            }
                            
                            
                        }
                    }
                    VStack {
                        ButtonAction(buttonColor: .white, borderColor: .black, textColor: .black, text: "Cancel", action: {
                            mode.wrappedValue.dismiss()
                        })
                        ButtonAction(buttonColor: Colors.secondary, borderColor: Colors.secondary , textColor: .white, text: "Update dose", action: {})
                    }
                }
                .padding(.top, Device.screenHeight * 0.08)
                .padding(.horizontal)
            }
        }.ignoresSafeArea()
    }
}

struct UpdateDose_Previews: PreviewProvider {
    static var previews: some View {
        UpdateDose()
    }
}

//
//  UpdateDose.swift
//  vetsourceApp
//
//  Created by Kevin Velasco on 10/5/23.
//

import SwiftUI
import AlertToast

struct UpdateDose: View {
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    var product: Product?
    @EnvironmentObject var petModel: PetViewModel
    var body: some View {
        
        ZStack(alignment: .top) {
            Color.white
            if let data = product {
                ScrollView {
                    VStack(alignment: .leading) {
                        HStack {
                            Text("View suggestion").fontWeight(.medium).font(.title)
                            Spacer()
                            Button {
                                mode.wrappedValue.dismiss()
                            } label: {
                                Image(systemName: "xmark").font(.system(size: 22)).fontWeight(.medium).padding(.trailing).foregroundColor(.black)
                            }
                            
                        }.padding(.bottom, Device.screenHeight * 0.02)
                        
                        
                        Text(data.productStatus.reason)
                            .foregroundColor(Colors.subtitle)
                        
                        
                        Text("Your previous dose was:").font(.system(size: 18)).fontWeight(.semibold).padding(.top, Device.screenHeight * 0.01)
                        
                        VStack {
                            HStack(alignment: .top) {
                                Image(data.image).resizable().frame(width: Device.screenWidth * 0.2, height: Device.screenWidth * 0.2).padding(.leading)
                                
                                VStack(alignment: .leading) {
                                    
                                    Text(data.name)
                                        .padding(.bottom, Device.screenHeight * 0.03)
                                        .padding(.top)
                                        .foregroundColor(Colors.subtitle)
                                        .lineLimit(1)
                                    
                                    Text("Strength / Size").foregroundColor(Colors.subtitle).fontWeight(.medium).padding(.bottom, Device.screenHeight  * 0.001)
                                    
                                    Text(data.size).foregroundColor(.black).fontWeight(.medium).padding(.bottom, Device.screenHeight  * 0.001)
                                    Text("Packaging").foregroundColor(Colors.subtitle).fontWeight(.medium).padding(.bottom, Device.screenHeight  * 0.001)
                                    
                                    Text(data.pakage).foregroundColor(.black).fontWeight(.medium).padding(.bottom, Device.screenHeight  * 0.001)
                                    Text("Quantity").foregroundColor(Colors.subtitle).fontWeight(.medium).padding(.bottom, Device.screenHeight  * 0.001)
                                    Text("\(data.quantity)")
                                }
                            }
                            
                            Text("Your dose will be updated to:").font(.system(size: 18)).fontWeight(.semibold)
                            
                            HStack(alignment: .top) {
                                Image(data.image).resizable().frame(width: Device.screenWidth * 0.2, height: Device.screenWidth * 0.2).padding(.leading)
                                
                                VStack(alignment: .leading) {
                                    
                                    Text(data.name)
                                        .padding(.bottom, Device.screenHeight * 0.02)
                                        .padding(.top)
                                        .foregroundColor(Colors.subtitle)
                                        .lineLimit(1)
                                    
                                    Text("Packaging").foregroundColor(Colors.subtitle).fontWeight(.medium).padding(.bottom, Device.screenHeight  * 0.001)
                                    
                                    Text(data.pakage).foregroundColor(.black).fontWeight(.medium).padding(.bottom, Device.screenHeight  * 0.001)
                                    
                                    
                                    Text("Quantity").foregroundColor(Colors.subtitle).fontWeight(.medium).padding(.bottom, Device.screenHeight  * 0.001)
                                    Text("\(data.quantity + data.productStatus.nexQuantity)")
                                }
                                
                            }
                        }
                    }
                    .padding(.top, Device.screenHeight * 0.07)
                    .padding(.horizontal)
                    
                    VStack {
                        ButtonAction(buttonColor: .white, borderColor: .black, textColor: .black, text: "Cancel", action: {
                            mode.wrappedValue.dismiss()
                        })
                        .padding(.top)
                        .padding(.horizontal)
                        
                        ButtonAction(buttonColor: Colors.secondary, borderColor: Colors.secondary , textColor: .white, text: "Update dose", action: {
                            petModel.updateDose()
                            mode.wrappedValue.dismiss()
                        })
                        .padding(.top, Device.screenHeight * 0.006)
                        .padding(.horizontal)
                        
                    }
                    .border(width: 1, edges: [.top], color: Color.black.opacity(0.5))
                    .padding(.top)
                }
                .navigationBarHidden(true)
            }
        }
        .ignoresSafeArea()
    }
}

struct UpdateDose_Previews: PreviewProvider {
    static var previews: some View {
        UpdateDose(product: Product(name: "ROYAL CANIN VETERNIARY DIET Canine Gastrointestinal Low Fat Dry Dog Food", quantity: 1, size: "4-10 lbs (Orange)", pakage: "3 Chewables", image: "dog", productStatus: ProductStatus(currentStatus: status.updateRequired, reason: "", nexQuantity: 2),nextAutShip: "25/05/2023",frecuency: "montly"))
    }
}

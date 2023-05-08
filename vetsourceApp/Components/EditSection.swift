//
//  EditSection.swift
//  vetsourceApp
//
//  Created by Kevin Velasco on 8/5/23.
//

import SwiftUI

struct EditSection: View {
    
    @State var edit = false
    @Binding var text: String

    var label: String;
    var placeholder: String
    var save: ()->Void
    
    
    var body: some View {
        HStack {
            
            VStack(alignment: .leading) {
                Text(label).foregroundColor(Colors.subtitle).padding(.bottom, 5)
                if !edit {
                    VStack {
                        Text(placeholder).foregroundColor(Colors.title)
                    }.padding(.bottom, Device.screenHeight * 0.036)
                } else {
                    VStack {
                        TextField(placeholder, text: $text)
                            .padding(12)
                            .cornerRadius(5)
                            .foregroundColor(Colors.title)
                            .overlay(
                                RoundedRectangle(cornerRadius: 5)
                                    .stroke(Color(hex: "#569722"), lineWidth: 1)
                            )
                    }.padding(.bottom, Device.screenHeight * 0.036)
                }
            }
            
            Spacer()
            Button {
                if(edit) {
                    save()
                }
                edit.toggle()
            } label: {
                HStack{
                    Image(systemName: edit ?  "checkmark" :"pencil").foregroundColor(.black)
                    Text( edit ? "Save" :"Edit").foregroundColor(Colors.title)
                }
                .padding(12)
                .cornerRadius(5)
                .overlay(
                    RoundedRectangle(cornerRadius: 5)
                        .stroke(Color.black, lineWidth: 1)
                )
            }
            
        }.padding(.horizontal)
        
    }
}

struct EditSection_Previews: PreviewProvider {
    static var previews: some View {
        EditSection(text: .constant("test"), label: "Name", placeholder: "", save: {} )
    }
}

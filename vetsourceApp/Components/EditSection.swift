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
                Text(label).foregroundColor(Colors.subtitle)
                if !edit {
                    VStack {
                        Text(placeholder).foregroundColor(Colors.title)
                    }
                    .padding(.top, Device.screenHeight * 0.01)
                    .padding(.bottom, Device.screenHeight * 0.036)
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
            
            if (edit) {
                Button {
                    withAnimation(.linear(duration: 0.2)) {
                        edit.toggle()
                    }
                } label: {
                    HStack{
                        Image(systemName: "checkmark" ).foregroundColor(.black)
                        Text("Save").foregroundColor(Colors.title)
                    }
                    .padding(12)
                    .cornerRadius(5)
                    .overlay(
                        RoundedRectangle(cornerRadius: 5)
                            .stroke(Color.black, lineWidth: 1)
                    )
                }
            } else {
                Button {
                    if(edit) {
                        save()
                    }
                    withAnimation(.linear(duration: 0.2)) {
                        edit.toggle()
                    }
                } label: {
                    HStack{
                        Image(systemName: "pencil" ).foregroundColor(.black)
                        Text("Edit").foregroundColor(Colors.title)
                    }
                    .padding(12)
                    .cornerRadius(5)
                    .overlay(
                        RoundedRectangle(cornerRadius: 5)
                            .stroke(Color.black, lineWidth: 1)
                    )
                }.padding(.top, Device.screenHeight * 0.02)
            }
            
            
        }.padding(.horizontal)
        
    }
}

struct EditSection_Previews: PreviewProvider {
    static var previews: some View {
        EditSection(text: .constant("test"), label: "Name", placeholder: "hello world", save: {} )
    }
}

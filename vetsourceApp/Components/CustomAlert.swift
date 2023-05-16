//
//  SwiftUIView.swift
//  HabitsIOS
//
//  Created by Kevin Velasco on 12/4/23.
//

import SwiftUI

struct CustomAlert: View {
    var screen = UIScreen.main.bounds.size
    
    var action: ()-> Void
    var back: (()-> Void)?
    
    var body: some View {
        
        ZStack {
            VStack(){
                HStack(alignment: .center) {
                    Image(systemName: "checkmark.circle").font(.system(size: 25)).fontWeight(.bold).foregroundColor(Color(hex: "78BB43"))
                    Text("Your product has been updated")
                        .font(.system(size: 22)).fontWeight(.medium)
                    
                    Button {
                        action()
                    } label: {
                        Image(systemName: "xmark").font(.system(size: 22)).fontWeight(.medium).foregroundColor(.black)
                    }
                }
            }
            .frame(width: screen.width * 0.94)
            .padding(.vertical, 25)
            .background(Color(hex: "E0FFC8"))
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color(hex: "78BB43"), lineWidth: 1))
        }
        .frame(height: Device.screenHeight * 0.9, alignment: .bottom)
    }
}

struct CustomAlert_Previews: PreviewProvider {
    static var previews: some View {
        CustomAlert(action: {})
    }
}


struct BlurView : UIViewRepresentable {
    func updateUIView(_ uiView: UIViewType, context: Context) {}
    
    
    func makeUIView(context: Context) -> some UIView {
        let view = UIVisualEffectView(effect: UIBlurEffect(style: .systemUltraThinMaterial))
        
        return view
    }
    
    
}

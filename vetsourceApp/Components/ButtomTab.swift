//
//  ButtomTab.swift
//  vetsourceApp
//
//  Created by Kevin Velasco on 4/5/23.
//

import SwiftUI




struct ButtomTab: View {
    static  var screen = UIScreen.main.bounds
    var normalIcon = screen.width * 0.07
    var middleIcon = screen.width * 0.11
    
    @ObservedObject var navigationModel: NavigationModel;
    
    var body: some View {
        HStack {
            ForEach(Icons.allCases, id: \.self) { icon in
                Spacer()
                Button {
                    navigationModel.selectedTab = icon.rawValue
                } label: {
                    Image(icon.rawValue == navigationModel.selectedTab ? "\(icon.rawValue)Active":  icon.rawValue )
                        .resizable()
                        .frame(
                            width: icon == Icons.navigation ?
                            middleIcon
                            :normalIcon,
                            height: icon == Icons.navigation
                            ? middleIcon
                            : normalIcon).padding(.bottom)
                }.disabled(icon.rawValue == Icons.navigation.rawValue ? true : false)
                Spacer()
            }
        }
        .frame(width: ButtomTab.screen.width * 0.99, height: ButtomTab.screen.height * 0.09)
        .background(.white)
        .roundedCorner(15, corners: [.topLeft, .topRight])
        
        
    }
}


enum Icons: String, CaseIterable {
    case user = "user"
    case notification = "notification"
    case navigation = "navigation"
    case car = "car"
    case find = "find"
}

struct ButtomTab_Previews: PreviewProvider {
    static var previews: some View {
        ButtomTab(navigationModel: NavigationModel())
    }
}

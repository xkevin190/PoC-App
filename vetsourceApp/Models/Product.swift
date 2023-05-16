//
//  Product.swift
//  vetsourceApp
//
//  Created by Kevin Velasco on 11/5/23.
//

import Foundation


struct Product: Identifiable  {
    var id: UUID = UUID()
    var name: String
    var quantity: Int
    var size: String
    var pakage: String
    var image: String
    var productStatus : ProductStatus
    var nextAutShip: String
    var frecuency: String
}




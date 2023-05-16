//
//  ProductStatus.swift
//  vetsourceApp
//
//  Created by Kevin Velasco on 12/5/23.
//

import Foundation

struct ProductStatus {
    var currentStatus: status
    var reason: String;
    var nexQuantity: Int;
}

enum status {
    case active
    case updateRequired
}

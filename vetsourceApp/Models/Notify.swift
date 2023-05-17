//
//  Notify.swift
//  vetsourceApp
//
//  Created by Kevin Velasco on 16/5/23.
//

import Foundation


struct Notify:Identifiable {
    var id = UUID()
    var title: String
    var descripton: String;
    var action: String;
    var ButtonAction: Bool
    var petID: UUID
}

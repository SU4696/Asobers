//
//  itemModel.swift
//  Asobers
//
//  Created by Suyeon Cho on 22/10/23.
//

import Foundation
import SwiftUI

struct Item: Identifiable {
    var id: UUID = UUID()
    var date: String
    var status: Bool
    var name: String
    var measurement: String
    var amount: Int
    var reminderStatus: Bool
    var frequency: String
    var progress: Int
    var goal: Int
    var favouriteColour: Color = .black
    var iconName: String = "noDescription"
}

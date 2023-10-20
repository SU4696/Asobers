//
//  itemModel.swift
//  Asobers
//
//  Created by Suyeon Cho on 20/10/23.
//

import Foundation
import SwiftUI

struct Learner: Identifiable {
    var id: UUID = UUID()
    var date: String
    var status: String
    var name: String
    var measurement: String
    var amount: String
    var reminderStatus: String
    var frequency: Int
    var progress: Int
    var goal: Int
    var favouriteColour: Color = .black
    var iconName: String = "noDescription"
}

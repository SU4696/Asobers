//
//  itemDataModel.swift
//  Asobers
//
//  Created by Suyeon Cho on 22/10/23.
//
import Foundation
import SwiftUI


struct DefaultItem: Identifiable {

    var id: UUID = UUID()
    var data: String
    var name: String
    var measurement: String
    var amount: Int64
    var reminderStatus: Bool
    var frequency: String
    var progress: Int64
    var goal: Int64
    var selectedColor: Color
    var selectedIcon: String
}


class itemDataModel  {
    var defaultItems: [DefaultItem] = [
        DefaultItem(data: "Goal", name: "Water", measurement: "ml", amount: 100, reminderStatus: false, frequency: "Every 1 hour", progress: 0, goal: 1500, selectedColor: .pink, selectedIcon: "person.fill"),
        DefaultItem(data: "Limit",  name: "Coffee", measurement: "Cup", amount: 1, reminderStatus: false, frequency: "Every 1 hour", progress: 0, goal: 4, selectedColor: .pink, selectedIcon: "person.fill"),
        DefaultItem(data: "Limit", name: "Tobacco", measurement: "None", amount: 1, reminderStatus: false, frequency: "Every 1 hour", progress: 0, goal: 5, selectedColor: .pink, selectedIcon: "person.fill"),
       
    
    ]
    
    


}

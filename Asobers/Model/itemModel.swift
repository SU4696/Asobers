//
//  itemModel.swift
//  Asobers
//
//  Created by Suyeon Cho on 22/10/23.
//

import Foundation
import CoreData

struct ItemListViewModel: Identifiable {
    
    private let itemList: Item
    
    init(itemList: Item) {
        self.itemList = itemList
    }
    
    var id: NSManagedObjectID {
        itemList.objectID
    }
    
    var data: String {
        itemList.data ?? ""
    }
    
    var status: Bool {
        itemList.status 
    }
    
    var name: String {
        itemList.name ?? ""
    }
    
    var measurement: String {
        itemList.measurement ?? ""
    }
    var amount: Int64 {
        itemList.amount 
    }
    
    var reminderStatus: Bool {
        itemList.reminderStatus
    }
    
    var frequency: String {
        itemList.frequency ?? ""
    }
    
    var progress: Int64 {
        itemList.progress
    }
    
    var goal: Int64 {
        itemList.goal
    }
    
    var favouriteColour: String {
        itemList.favouriteColour ?? ""
    }
    
    var iconName: String {
        itemList.iconName ?? ""
    }
   
}

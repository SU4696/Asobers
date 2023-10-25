//
//  ItemExtensions.swift
//  Asobers
//
//  Created by Suyeon Cho on 24/10/23.
//

import Foundation
import CoreData

extension Item {
    static var all: NSFetchRequest<Item>{
        let request = Item.fetchRequest()
        request.sortDescriptors = []
        return request
    }
    
    func save() throws {
        try CoreDataManager.shared.context.save()
    }
}

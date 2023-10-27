//
//  ContentViewModel.swift
//  Asobers
//
//  Created by Suyeon Cho on 24/10/23.
//

import Foundation
import CoreData


class ContentViewModel: NSObject, ObservableObject {
    
    private var fetchedResultsController: NSFetchedResultsController<Item>
    private(set) var context: NSManagedObjectContext
    
    @Published var itemLists: [ItemListViewModel] = []
    
    override init() {
        self.context = CoreDataManager.shared.context
        fetchedResultsController = NSFetchedResultsController(fetchRequest: Item.all, managedObjectContext: context, sectionNameKeyPath: nil, cacheName: nil)
        super.init()
        fetchedResultsController.delegate = self
        
        do {
            try fetchedResultsController.performFetch()
            guard let itemLists = fetchedResultsController.fetchedObjects else { return }
            self.itemLists = itemLists.map(ItemListViewModel.init)
            
        } catch {
            print(error)
        }
    }
 
    
    func saveNewList(newItemData: String,newItemName:String, newItemMeasurement:String, newItemAmount:Int64, newItemRS:Bool, newItemFrequency:String, newItemProgress:Int64,newItemGoal:Int64, selectColor: String, selectedIconName:String) {
        
        let itemList = Item(context: context)
        itemList.data = newItemData
        itemList.name = newItemName
        itemList.measurement = newItemMeasurement
        itemList.amount = newItemAmount
        itemList.reminderStatus = newItemRS
        itemList.frequency = newItemFrequency
        itemList.progress = newItemProgress
        itemList.goal = newItemGoal
        itemList.favouriteColour = selectColor
        itemList.iconName = selectedIconName
        
        do {
            try itemList.save()
        } catch {
            print(error)
        }
        
    }
  

}

extension ContentViewModel: NSFetchedResultsControllerDelegate {
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        guard let itemLists = controller.fetchedObjects as? [Item] else { return }
        self.itemLists = itemLists.map(ItemListViewModel.init)
    }
}

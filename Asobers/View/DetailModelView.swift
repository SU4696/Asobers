//
//  DetailModelView.swift
//  Asobers
//
//  Created by Suyeon Cho on 27/10/23.
//

import SwiftUI

struct DetailModelView: View {
    @State private var refreshID = UUID()
    
    let itemList: ItemListViewModel
    
    func update(itemList: Item, name: String? = nil, measurement: String? = nil, amount: Int64? = nil, reminderStatus: Bool? = nil, frequency: String? = nil, progress: Int64? = nil,goal: Int64? = nil) {
        // create a temp var to tell if an attribute is changed
        var hasChanges: Bool = false
        
        
        // update the attributes if a value is passed into the function
        if name != nil {
            itemList.name = name!
            hasChanges = true
        }
        if measurement != nil {
            itemList.measurement = measurement!
            hasChanges = true
        }
        if amount != nil {
            itemList.amount = amount!
            hasChanges = true
        }
        if reminderStatus != nil {
            itemList.reminderStatus = reminderStatus!
            hasChanges = true
        }
        if frequency != nil {
            itemList.frequency = frequency!
            hasChanges = true
        }
        if progress != nil {
            itemList.progress = progress!
            hasChanges = true
        }
        if goal != nil {
            itemList.goal = goal!
            hasChanges = true
        }
        
        // save changes if any
        if hasChanges {
            itemList.saveChanges()
        }
    }
    
    
    
    var body: some View {
        
        NavigationView{
            VStack {
                
                Text(itemList.name)
                    .font(.title)
                    .bold()
                    .padding()
                
                Image(systemName: itemList.iconName)
                    .font(.system(size: 150))
                    .foregroundColor(Color.colorFromHex(itemList.favouriteColour))
                    .padding(.bottom, 70)
                
                Text("\((itemList.progress/itemList.goal)*100)% ") //amount of every cup
                    .padding(.bottom, 30)
                    .padding(.top, 10)
                
                
                HStack {
                    
                    Button(action: {
                        update(itemList: itemList.item, progress: Int64(itemList.progress - itemList.amount))
                        refreshID = UUID()
                    }) {
                        Text("-")
                            .bold()
                            .font(.title2)
                            .padding(20)
                            .foregroundColor(.white)
                            .background(Color.colorFromHex(itemList.favouriteColour))
                            .clipShape(Circle())
                            .shadow(radius: 10)
                            .foregroundColor(.cyan)
                    }
                    
                    Text("\(itemList.progress)")
                        .font(.title)
                        .bold()
                        .padding(.horizontal, 70)
                        .frame(minWidth: 30)
                    
                    
                    Button(action: {
                        
                        update(itemList: itemList.item, progress: Int64(itemList.progress + itemList.amount))
                        refreshID = UUID()
                    }) {
                        Text("+")
                            .bold()
                            .font(.title2)
                            .padding(20)
                            .foregroundColor(.white)
                            .background(Color.colorFromHex(itemList.favouriteColour))
                            .clipShape(Circle())
                            .shadow(radius: 10)
                    }
                }
                
                Text("\(itemList.goal) / Day") //amount of every cup
                    .foregroundColor(.secondary)
                    .padding(.bottom, 30)
                    .padding(.top, 10)
                
                if itemList.reminderStatus{
                    Text("Reminder: \(itemList.frequency)") //reminder frequency
                        .padding(.top, 30)
                }
            }
            .padding()
            .padding(.bottom, 150)
            
        }
    }
    
}


//
//  ItemListView.swift
//  Asobers
//
//  Created by Suyeon Cho on 24/10/23.
//

import SwiftUI

struct ItemListView: View {
    @State private var refreshID = UUID()
    @State private var isPresentingUpdateItemView = false
    let itemLists: [ItemListViewModel]
    
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
        
        
        
        List {
            Section(header:
                        Text("Goal")
                .fontWeight(.bold)
                .foregroundColor(Color.black)
                    
            ) {
                
                
                ForEach(itemLists) { itemList in
                    if itemList.data == "Goal" {
                        HStack {
                        NavigationLink {
                            DetailModelView(itemList: itemList)
                                .navigationBarItems(trailing:Button(action: {
                                    // Present the UpdateItemView
                                    isPresentingUpdateItemView.toggle()
                                }) {
                                    Text("Edit")
                                }
                                .sheet(isPresented: $isPresentingUpdateItemView) {
                                    UpdateItemView(itemList: itemList)
                                })
                        } label: {
                            HStack {
                                Image(systemName: itemList.iconName)
                                    .imageScale(.medium)
                                    .foregroundColor(Color.colorFromHex(itemList.favouriteColour))
                             
                                    Text(itemList.name)
                                    
                                Text("\(itemList.progress)/\(itemList.goal)  \(itemList.measurement)").foregroundColor(Color(.systemGray2))
                               
                                Spacer()
                                Button(action: {
                                    update(itemList: itemList.item, progress: Int64(itemList.progress + itemList.amount))
                                    refreshID = UUID()
                                }) {
                                    Text("+")
                                        .bold()
                                        .font(.title2)
                                        .padding(10)
                                        .foregroundColor(.white)
                                        .background(Color.colorFromHex(itemList.favouriteColour))
                                        .clipShape(Circle())
                                        .shadow(radius: 10)
                                        .foregroundColor(.cyan)
                                }.buttonStyle(PlainButtonStyle())
                                
                            }
                            
                        }
                            
                        
                        } }
                }
                
            }
            Section(header:
                        Text("Limits")
                .fontWeight(.bold)
                .foregroundColor(Color.black)
            ) {
                ForEach(itemLists) { itemList in
                    if itemList.data == "Limit" {
                        HStack {
                        NavigationLink {
                            DetailModelView(itemList: itemList)
                                .navigationBarItems(trailing:Button(action: {
                                    // Present the UpdateItemView
                                    isPresentingUpdateItemView.toggle()
                                }) {
                                    Text("Edit")
                                }
                                .sheet(isPresented: $isPresentingUpdateItemView) {
                                    UpdateItemView(itemList: itemList)
                                })
                        } label: {
                            HStack {
                                Image(systemName: itemList.iconName)
                                    .imageScale(.medium)
                                    .foregroundColor(Color.colorFromHex(itemList.favouriteColour))
                             
                                    Text(itemList.name)
                                    
                                Text("\(itemList.progress)/\(itemList.goal)  \(itemList.measurement)").foregroundColor(Color(.systemGray2))
                               
                                Spacer()
                                Button(action: {
                                    update(itemList: itemList.item, progress: Int64(itemList.progress + itemList.amount))
                                    refreshID = UUID()
                                }) {
                                    Text("+")
                                        .bold()
                                        .font(.title2)
                                        .padding(10)
                                        .foregroundColor(.white)
                                        .background(Color.colorFromHex(itemList.favouriteColour))
                                        .clipShape(Circle())
                                        .shadow(radius: 10)
                                        .foregroundColor(.cyan)
                                }.buttonStyle(PlainButtonStyle())
                                
                            }
                            
                        }
                            
                        
                        }
                    }
                }
                
            }
        }
    }
}

#Preview {
    ItemListView(itemLists: [])
}

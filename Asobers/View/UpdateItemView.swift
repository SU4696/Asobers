//
//  UpdateItemView.swift
//  Asobers
//
//  Created by Suyeon Cho on 30/10/23.
//

import SwiftUI

struct UpdateItemView: View { 
    @Environment(\.dismiss) private var dismiss
    
    @State private var newItemName: String = ""
    @State private var newItemMeasurement: String = ""
    @State private var newItemAmount: Int64 = 1
    @State private var newItemGoal: Int64 = 10
    @State private var newReminderStatus: Bool = false
    @State private var newItemFrequency: String = ""
    
    let itemList: ItemListViewModel
    
    func update(itemList: Item, name: String? = nil, measurement: String? = nil, amount: Int64? = nil, reminderStatus: Bool? = nil, frequency: String? = nil, goal: Int64? = nil, favouriteColour: String? = nil, iconName: String? = nil) {
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
       
        if goal != nil {
            itemList.goal = goal!
            hasChanges = true
        }
        if favouriteColour != nil {
            itemList.favouriteColour = favouriteColour!
            hasChanges = true
        }
        if iconName != nil {
            itemList.iconName = iconName!
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
                VStack {
                    ZStack(alignment: .center
                    ) {
                        Circle()
                            .fill(Color.colorFromHex(itemList.favouriteColour))
                            .frame(width: 80, height: 80)
                        Image(systemName: "\(itemList.iconName)")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 50, height: 50)
                            .padding(10)
                            .foregroundColor(.white)
                            .padding(30)
                        
                    }
                   
                    
                    TextField(itemList.name , text: $newItemName)
                        .font(.title)
                        .bold()
                        .multilineTextAlignment(.center)
                        .padding(.top,10)
                    
                    
                    
                    if(newItemMeasurement=="None"){
                        Text(" Day")
                            .font(.footnote)
                    }
                    else{
                        Text("\(newItemMeasurement)\(" / Day")")
                            .font(.footnote)
                    }
                    
                    
                    HStack(spacing: 50.0) {
                        
                        Button(action: {newItemGoal = Int64(itemList.goal - newItemAmount)}) {
                            Image(systemName: "minus.circle.fill")
                                .font(.largeTitle)
                                .foregroundColor(Color.colorFromHex(itemList.favouriteColour))
                        }
                        
                        Text( verbatim:"\(itemList.goal)")
                            .font(.largeTitle)
                            .bold()
                        
                        
                        Button(action: {newItemGoal = Int64(itemList.goal + newItemAmount)}) {
                            Image(systemName: "plus.circle.fill")
                                .font(.largeTitle)
                                .foregroundColor(Color.colorFromHex(itemList.favouriteColour))
                        }
                        
                    }.padding(.top,20)
                        .padding(.bottom,30)
                }
                .background().clipShape(RoundedRectangle(cornerRadius: 10.0,style: .continuous)).padding()
               
                
               
                
                Form {
                    Picker("Measurement", selection: $newItemMeasurement) {
                        Text("None").tag("None")
                        Text("ml").tag("ml")
                        Text("Cup").tag("Cup")
                    }
                    .onChange(of: newItemMeasurement) { newValue in
                        if newValue == "ml" {
                            newItemAmount = 100
                        } else if newValue == "Cup" {
                            newItemAmount = 1
                        }
                    }
                    
                    HStack {
                        Text("Amount")
                        
                        Spacer()
                        
                        TextField("Amount", value: $newItemAmount, formatter: NumberFormatter()).foregroundColor(.gray)
                            .multilineTextAlignment(.trailing)
                    }
                    
                    Toggle("Reminder", isOn: $newReminderStatus)
                    
                    if newReminderStatus {
                        VStack {
                            Picker("Frequency", selection: $newItemFrequency) {
                                Text("Every 30 minutes").tag("Every 30 minutes")
                                Text("Every hour").tag("Every hour")
                                Text("Every 1.5 hours").tag("Every 1.5 hours")
                                Text("Every 2 hours").tag("Every 2 hours")
                                Text("Every 2.5 hours").tag("Every 2.5 hours")
                                Text("Every 3 hours").tag("Every  hours")
                            }
                        }
                    }
                }

                .navigationBarItems(leading: Button(action: {dismiss()}, label: {
                    Text("Cancel")
                }),trailing: Button(action: {
                    if !newItemName.isEmpty{
                        
                        update(itemList: itemList.item, name:newItemName)
                        dismiss()
                    }
                    
                }) {
                    Text("Save")
                })
                
            }.background(Color(.systemGray6))
        }
    }
}
//
//#Preview {
//    UpdateItemView()
//}

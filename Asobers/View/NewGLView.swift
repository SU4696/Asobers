//
//  NewGLView.swift
//  Asobers
//
//  Created by Suyeon Cho on 24/10/23.
//
import Foundation
import SwiftUI

struct NewGLView: View {
    
    @State private var newItemData: String = "Goal" //default for now
    @State private var newItemName: String = "Water" //default for now
    @State private var newItemMeasurement: String = "" //dafault
    @State private var newItemAmount: Int64 = 1
    @State private var newItemGoal: Int64 = 10
    @State private var newReminderStatus: Bool = false
    @State private var newItemFrequency: Float = 1.0
    
    var onSave: (String, Bool,String, String, Int64, Bool, String, Int64,Int64) -> Void
    
    var body: some View {
        VStack {
            Button(action: {
                    onSave(newItemData, false, newItemName, newItemMeasurement, newItemAmount, newReminderStatus, "", 0, newItemGoal)
                
            }) {
                Text("Add Item")
            }
            
            VStack {
                Image("\(newItemName)")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 132.0, height: 132.0)
                
                Text("\(newItemName)")
                    .font(.system(size: 27))
                    .bold()
                
                if(newItemMeasurement==""){
                    Text(" Day")
                        .font(.footnote)
                }
                else{
                    Text("\(newItemMeasurement)\(" / Day")")
                        .font(.footnote)
                }
                
            }
            .padding()
            
            HStack(spacing: 50.0) {
                
                Button(action: {newItemGoal += -newItemAmount}) {
                    Image(systemName: "minus.circle.fill")
                        .font(.largeTitle)
                        .foregroundColor(.blue)
                }
                
                Text(verbatim:"\(newItemGoal)")
                    .font(.largeTitle)
                    .bold()
                
                
                Button(action: {newItemGoal += newItemAmount}) {
                    Image(systemName: "plus.circle.fill")
                        .font(.largeTitle)
                        .foregroundColor(.blue)
                }
                
            }
            
            Form {
                
                Menu("Measurement"){
                    
                    Button("None", action: {
                        newItemMeasurement=""
                    })
                    Button("ml", action: {
                        newItemMeasurement="ml"
                    })
                    
                    Button("Cup", action: {
                        newItemMeasurement="Cup"
                    })
                }
                .foregroundColor(.black)
                
                TextField("Amount", value: $newItemAmount, formatter: NumberFormatter())

                
                Toggle(isOn: $newReminderStatus ) {
                    Text("Reminder")
                }
                
                
                if  newReminderStatus {
                    Menu("Frequency"){
                        Button("Every 30 minutes", action: { newItemFrequency=0.5})
                        Button("Every hour", action: {newItemFrequency=1.0})
                        Button("Every 1.5 hours", action: {newItemFrequency=1.5})
                        Button("Every 2 hours", action: {newItemFrequency=2.0})
                        Button("Every 2.5 hours", action: {newItemFrequency=2.5})
                        Button("Every 3 hours", action: {newItemFrequency=3.0})
                    }
                    .foregroundColor(.black)
                }
                
            }
            .padding()
        }
        
    }
}

//
//#Preview {
//    NewGLView(onSave: <#(String, Bool, String, String, Int64, Bool, String, Int64, Int64) -> Void#>)
//}


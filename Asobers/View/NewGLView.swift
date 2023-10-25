//
//  NewGLView.swift
//  Asobers
//
//  Created by Suyeon Cho on 24/10/23.
//
import Foundation
import SwiftUI

struct NewGLView: View {
    
    @State private var newItemData: String = ""
    @State private var newItemName: String = ""
    @State private var newItemMeasurement: String = ""
    @State private var newItemAmount: Int64 = 1
    @State private var newItemGoal: Int64 = 10
   
    var onSave: (String, Bool,String, String, Int64, Bool, String, Int64,Int64) -> Void
    
    var body: some View {
        VStack {
            Button(action: {
                onSave(newItemData, false, newItemName, newItemMeasurement, newItemAmount, false, "", 0, newItemGoal)
                
            }) {
                Text("Add Item")
            }
            Form {
                TextField("Data", text: $newItemData)
                
                TextField("Name", text: $newItemName)
                TextField("Measurement", text: $newItemMeasurement)
                TextField("Amount", value: $newItemAmount, formatter: NumberFormatter())
                TextField("Goal", value: $newItemGoal, formatter: NumberFormatter())
                
               
            }
            
        }
        .padding()
    }
    
}
//
//#Preview {
//    NewGLView(onSave: <#(String, Bool, String, String, Int64, Bool, String, Int64, Int64) -> Void#>)
//}

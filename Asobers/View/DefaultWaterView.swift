//
//  DefaultGLView.swift
//  Asobers
//
//  Created by Suyeon Cho on 26/10/23.
//

import SwiftUI

struct DefaultWaterView: View {
    @Environment(\.dismiss) private var dismiss
    
    @State private var isColorPopoverPresented: Bool = false
    
    @State var newItemData: String = "Goal"
    @State private var newItemName: String = "Water"
    @State private var newItemMeasurement: String = "ml"
    @State private var newItemAmount: Int64 = 100
    @State private var newItemGoal: Int64 = 1500
    @State private var newReminderStatus: Bool = false
    @State private var newItemFrequency: String = "Every 30 minutes"
    @State private var selectedColor: Color = .blue
    @State private var selectedIcon:String = "drop.fill"
    
    
    var onSave: (String, String, String, Int64, Bool, String, Int64,Int64,String,String) -> Void
    
    var body: some View {
        NavigationView{
            VStack {
                VStack {
                    ZStack(alignment: .center
                    ) {
                        Circle()
                            .fill(selectedColor)
                            .frame(width: 80, height: 80)
                        Image(systemName: "\(selectedIcon)")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 50, height: 50)
                            .padding(10)
                            .foregroundColor(.white)
                            .onTapGesture {
                                isColorPopoverPresented.toggle()
                            }
                            .popover(isPresented: $isColorPopoverPresented, content: {
                                ColorIconSelectorModelView(selectedColor: $selectedColor, selectedIcon: $selectedIcon)
                                    .frame(minWidth: 300, maxHeight: 450)
                                    .presentationCompactAdaptation(.none)
                                    .padding(10)
                            })
                            .padding(30)
                        
                    }
                    
                    
                    TextField("Name", text: $newItemName)
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
                        
                        Button(action: {newItemGoal += -newItemAmount}) {
                            Image(systemName: "minus.circle.fill")
                                .font(.largeTitle)
                                .foregroundColor(selectedColor)
                        }
                        
                        Text(verbatim:"\(newItemGoal)")
                            .font(.largeTitle)
                            .bold()
                        
                        
                        Button(action: {newItemGoal += newItemAmount}) {
                            Image(systemName: "plus.circle.fill")
                                .font(.largeTitle)
                                .foregroundColor(selectedColor)
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
                        
                        Spacer() // 간격을 추가합니다.
                        
                        TextField("Amount", value: $newItemAmount, formatter: NumberFormatter()).foregroundColor(.gray) .multilineTextAlignment(.trailing)
                    }
                    
                    HStack {
                        Toggle(isOn: $newReminderStatus) {
                            Text("Reminder")
                        }
                    }
                    
                    if newReminderStatus {
                        VStack { // 메뉴 선택 사항을 별도의 VStack으로 묶습니다.
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
                    onSave(newItemData,
                           newItemName, newItemMeasurement, newItemAmount, newReminderStatus, newItemFrequency, 0, newItemGoal, selectedColor.hex,selectedIcon)
                    dismiss()
                    
                }) {
                    Text("Save")
                })
                
            }.background(Color(.systemGray6))
        }
    }
}


/* #Preview {
 DefaultGLView(defaultItems: DefaultItem(data: "Goal", name: "Water", measurement: "ml", amount: 100, reminderStatus: false, frequency: "Every 1 hour", progress: 0, goal: 1500, selectedColor: .black,selectedIcon: "person.fill"))
 }*/





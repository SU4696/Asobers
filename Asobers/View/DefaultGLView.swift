//
//  DefaultGLView.swift
//  Asobers
//
//  Created by Suyeon Cho on 26/10/23.
//

import SwiftUI

struct DefaultGLView: View {
    
   @Environment(\.dismiss) private var dismiss
    @State private var isColorPopoverPresented: Bool = false
   // var onSave: (String, String, String, Int64, Bool, String, Int64,Int64,String,String) -> Void
    @State var defaultItems: DefaultItem
    
    var body: some View {
        NavigationView{
            VStack {
                VStack {
                    ZStack(alignment: .center
                    ) {
                        Circle()
                            .fill(defaultItems.selectedColor)
                            .frame(width: 80, height: 80)
                        Image(systemName: "\(defaultItems.selectedIcon)")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 50, height: 50)
                            .padding(10)
                            .foregroundColor(.white)
                            .onTapGesture {
                                isColorPopoverPresented.toggle()
                            }
                            .padding(30)
                        
                    }
                    
                    
                    Text("\(defaultItems.name)")
                        .font(.title)
                        .bold()
                        .multilineTextAlignment(.center)
                        .padding(.top,10)
                    
                    
                    
                    if(defaultItems.measurement=="None"){
                     Text(" Day")
                     .font(.footnote)
                     }
                     else{
                     Text("\(defaultItems.measurement)\(" / Day")")
                     .font(.footnote)
                     }
                     
                     
                     HStack(spacing: 50.0) {
                     
                         Button(action: {defaultItems.goal -= defaultItems.amount}) {
                     Image(systemName: "minus.circle.fill")
                     .font(.largeTitle)
                     .foregroundColor(defaultItems.selectedColor)
                     }
                     
                         Text(verbatim:"\(defaultItems.goal)")
                     .font(.largeTitle)
                     .bold()
                     
                     
                         Button(action: {defaultItems.goal += defaultItems.amount}) {
                     Image(systemName: "plus.circle.fill")
                     .font(.largeTitle)
                     .foregroundColor(defaultItems.selectedColor)
                     }
                     
                     }.padding(.top,20)
                     .padding(.bottom,30)
                     }
                     .background().clipShape(RoundedRectangle(cornerRadius: 10.0,style: .continuous)).padding()
                     
                     
                     
                     
                     Form {
                     
                         Picker("Measurement", selection: $defaultItems.measurement) {
                             Text("None").tag("None")
                             Text("ml").tag("ml")
                             Text("Cup").tag("Cup")
                     }
                     
                     
                     HStack {
                     Text("Amount")
                     
                     Spacer() // 간격을 추가합니다.
                     
                         TextField("Amount", value: $defaultItems.amount, formatter: NumberFormatter()).foregroundColor(.gray) .multilineTextAlignment(.trailing)
                     }
                     
                     HStack {
                         Toggle(isOn: $defaultItems.reminderStatus) {
                     Text("Reminder")
                     }
                     }
                     
                         if defaultItems.reminderStatus {
                     VStack { // 메뉴 선택 사항을 별도의 VStack으로 묶습니다.
                         Picker("Frequency", selection: $defaultItems.frequency) {
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
                         /*onSave(defaultItems.data,
                                defaultItems.name, defaultItems.measurement, defaultItems.amount, defaultItems.reminderStatus, defaultItems.frequency, 0, defaultItems.goal, defaultItems.selectedColor.hex,defaultItems.selectedIcon)*/
                     
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
       
        
    


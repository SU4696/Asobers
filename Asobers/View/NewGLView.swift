import Foundation
import SwiftUI

struct NewGLView: View {
    
    @State private var newItemData: String = "" 
    @State private var newItemName: String = ""
    @State private var newItemMeasurement: String = ""
    @State private var newItemAmount: Int64 = 1
    @State private var newItemGoal: Int64 = 10
    @State private var newReminderStatus: Bool = false
    @State private var newItemFrequency: Float = 1.0
    @State private var isColorPopoverPresented: Bool = false
    @State private var selectedColor: Color = .pink
    @State private var selectedIcon:String = "list.dash"
    
    var onSave: (String, Bool,String, String, Int64, Bool, String, Int64,Int64) -> Void
    
    var body: some View {
        VStack {
            Button(action: {
                    onSave(newItemData, false, newItemName, newItemMeasurement, newItemAmount, newReminderStatus, "", 0, newItemGoal)
                
            }) {
                Text("Add Item")
            }
            
            VStack {
               
                
            /*    Button(action:{isColorPopoverPresented.toggle()}) {
                    Text("Icon")
                    
                }
                .popover(isPresented: $isColorPopoverPresented, content: {
                    ColorIconSelectorModelView(selectedColor: $selectedColor, selectedIcon: $selectedIcon)
                        .frame(minWidth: 300, maxHeight: 450)
                        .presentationCompactAdaptation(.none)
                       // .padding(.vertical,10)
                        
                })*/
                
            
                Image(systemName: "\(selectedIcon)")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 100, height: 100)
                    .foregroundColor(selectedColor)
                    .onTapGesture {
                        isColorPopoverPresented.toggle()
                    }
                    .popover(isPresented: $isColorPopoverPresented, content: {
                        ColorIconSelectorModelView(selectedColor: $selectedColor, selectedIcon: $selectedIcon)
                            .frame(minWidth: 300, maxHeight: 450)
                            .presentationCompactAdaptation(.none)
                            .padding(10)
                    })
                
              
                     
                TextField("Name", value: $newItemName, formatter: DateFormatter())
                    .font(.system(size: 27))
                    .bold()
                    .multilineTextAlignment(.center)
                    
                    
                
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




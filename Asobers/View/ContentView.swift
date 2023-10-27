//
//  ContentView.swift
//  Asobers
//
//  Created by Suyeon Cho on 17/10/23.
//

import SwiftUI

struct SecondView: View {
    var body: some View {
        Text("New Page")
            .font(.title)
            .navigationBarTitle("Calendar")
    }
}

struct ContentView: View {
    @State private var newItemDataT: String = ""
    
    @AppStorage("_isFirstLaunching") var isFirstLaunching: Bool = false
   
    @State var isPresentedADD: Bool = false
    @State private var showingActionSheet = false
    
    @StateObject private var vm: ContentViewModel
    init(vm: ContentViewModel) {
        _vm = StateObject(wrappedValue: vm)
    }
    
    
    var body: some View {
      
        
        NavigationView {
            
            
            VStack {
                
                ItemListView(itemLists: vm.itemLists)
                
            }
            .navigationBarTitle("Today", displayMode: .inline)
            .navigationBarItems(
                leading: NavigationLink(destination:  SecondView()){
                    
                    Image(systemName:"calendar")
                        .bold()
                    
                    
                }
                ,
                trailing: Button(action: {
                    showingActionSheet = true
                }) {
                    Image(systemName: "plus")
                        .bold()
                }
                    .actionSheet(isPresented: $showingActionSheet) {
                        ActionSheet(
                            title: Text("Add"),
                            buttons: [
                                .default(Text("Goal")) {
                                    newItemDataT = "Goal"
                                    isPresentedADD = true
                                    
                                },
                                .default(Text("Limit")) {
                                    newItemDataT = "Limit"
                                    isPresentedADD = true
                                    
                                },
                                .cancel() {
                                    // Action to perform when the user cancels the Action Sheet
                                }
                            ]
                        )
                    }
                    .fullScreenCover(isPresented: $isPresentedADD) {
                        NewGLView {data,name, measurement, amount, reminderStatus, frequency, progress,goal,favoritColour,iconName in
                            // save
                            vm.saveNewList(newItemData : newItemDataT,
                                           newItemName: name,
                                           newItemMeasurement: measurement,
                                           newItemAmount : amount,
                                           newItemRS : reminderStatus,
                                           newItemFrequency : frequency,
                                           newItemProgress : progress,
                                           newItemGoal : goal,
                                           selectColor: favoritColour,
                                           selectedIconName: iconName
                                           
                            )
                        }
                    }
                    .fullScreenCover(isPresented: $isFirstLaunching) {
                        OnboardingOneView(/*isFirstLaunching: $isFirstLaunching*/)
                    }
            ) 
        }
        
        
        
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let vm = ContentViewModel()
        ContentView(vm: vm)
    }
}
//#Preview {
//    let vm = ContentViewModel()
//    ContentView(vm: vm)
//}


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
    @AppStorage("_isFirstLaunching") var isFirstLaunching: Bool = true
    @StateObject private var vm: ContentViewModel
    @State private var isPresented: Bool = false
    
    init(vm: ContentViewModel) {
        _vm = StateObject(wrappedValue: vm)
    }
    
    
    var body: some View {
        
        
        NavigationView {
            VStack {
                
                ItemListView(itemLists: vm.itemLists)
                
                Button("Add List") {
                    isPresented = true
                }.frame(maxWidth: .infinity, alignment: .trailing)
                    .padding()
                    .sheet(isPresented: $isPresented) {
                        NewGLView { data,status,name, measurement, amount, reminderStatus, frequency, progress,goal in
                            // save
                            vm.saveNewList(newItemData : data,
                                           newItemStatus:status,
                                           newItemName: name,
                                           newItemMeasurement: measurement,
                                           newItemAmount : amount,
                                           newItemRS : reminderStatus,
                                           newItemFrequency : frequency
                                           ,newItemProgress : progress
                                           ,newItemGoal : goal)
                        }
                    }
                
                
                
            }
            .navigationBarTitle("Today", displayMode: .inline)
            .navigationBarItems(
                leading: NavigationLink(destination:  SecondView()){
                    
                    Image(systemName:"calendar")
                        .bold()
                    
                    
                }
                ,
                trailing: NavigationLink(destination:  SecondView()){
                    
                    Image(systemName:"plus")
                        .bold()
                    
                }
            )
            
        } .fullScreenCover(isPresented: $isFirstLaunching) {
            OnboardingOneView(isFirstLaunching: $isFirstLaunching)
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

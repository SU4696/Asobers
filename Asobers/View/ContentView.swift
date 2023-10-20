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
    
    var body: some View {
        
        
        NavigationView {
            VStack {
               
                
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
            
        }
    }

}

#Preview {
    ContentView()
}

//
//  ItemListView.swift
//  Asobers
//
//  Created by Suyeon Cho on 24/10/23.
//

import SwiftUI

struct ItemListView: View {
    let itemLists: [ItemListViewModel]
    var body: some View {
        List {
            Section(header:
                        Text("Goal")
                .fontWeight(.bold)
                .foregroundColor(Color.black)
                    
            ) {
                ForEach(itemLists) { itemList in
                    if itemList.data == "Goal" {
                        Text(itemList.name)
                    }
                }
                
            }
            Section(header:
                        Text("Limits")
                .fontWeight(.bold)
                .foregroundColor(Color.black)
            ) {
                ForEach(itemLists) { itemList in
                    if itemList.data == "Limit" {
                        Text(itemList.name)
                    }
                }
                
            }
        }
    }
}

#Preview {
    ItemListView(itemLists: [])
}

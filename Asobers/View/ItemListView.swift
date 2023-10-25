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
        List(itemLists){
            itemList in
            Text(itemList.name)
        }
    }
}

#Preview {
    ItemListView(itemLists: [])
}

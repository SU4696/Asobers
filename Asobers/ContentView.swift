//
//  ContentView.swift
//  Asobers
//
//  Created by Suyeon Cho on 17/10/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "heart")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("SuSu7")
            Text("Hi guys")
        }
        .padding()
    }
}

#Preview {
    ContentView()
}

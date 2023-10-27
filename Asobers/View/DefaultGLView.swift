//
//  DefaultGLView.swift
//  Asobers
//
//  Created by Suyeon Cho on 26/10/23.
//

import SwiftUI

struct DefaultGLView: View {
    var defaultItems: DefaultItem
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    DefaultGLView(defaultItems: DefaultItem(data: "Goal", name: "Water", measurement: "ml", amount: 100, reminderStatus: false, frequency: "Every 1 hour", progress: 0, goal: 1500, selectedColor: .black,selectedIcon: "person.fill"))
}

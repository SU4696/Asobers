//
//  PopOverTestView.swift
//  Asobers
//
//  Created by Suyeon Cho on 22/10/23.
//

import SwiftUI

struct PopOverTestView: View {
    
    @State private var show = false
    @State private var selectedColor: Color = .red
    @State private var selectedIcon:String = ""
    @State private var isColorPopoverPresented: Bool = false
    
    var body: some View {
        
        Button(action:{isColorPopoverPresented.toggle()}) {
            Text("aaa")
            
        }
        .popover(isPresented: $isColorPopoverPresented, content: {
            ColorIconSelectorModelView(selectedColor: $selectedColor, selectedIcon: $selectedIcon)
                .frame(minWidth: 300, maxHeight: 450)
                .presentationCompactAdaptation(.none)
                .padding(.vertical,10)
                
        })
        
    }
}


#Preview {
    PopOverTestView()
}

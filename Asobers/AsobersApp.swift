//
//  AsobersApp.swift
//  Asobers
//
//  Created by Suyeon Cho on 17/10/23.
//

import SwiftUI

@main
struct AsobersApp: App {
    @Environment(\.colorScheme) var colorScheme

    
    var body: some Scene {
        WindowGroup {
            ContentView(vm:ContentViewModel())
                
        }
    }
}
#Preview {
    ContentView(vm:ContentViewModel())
}

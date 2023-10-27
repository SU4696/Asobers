//
//  OnboardingSecondView.swift
//  Asobers
//
//  Created by Maryam Vasilehbar on 10/26/23.
//

import SwiftUI
struct OnboardingSecondView: View {
    @State private var isPresented: Bool = false
    
    var viewModel = itemDataModel()
    
    var body: some View {
        NavigationStack{
        
        VStack {
            Text("Let's start together!")
                .bold()
                .font(.largeTitle)
                .foregroundColor(.pink)
                .padding(.top,60)
          
                List {
                    
                    Section("Goal"){
                        ForEach(viewModel.defaultItems) {
                            item in
                            if item.data == "Goal"{
                                NavigationLink{
                                    DefaultGLView(defaultItems: item)
                                } label: {
                                    HStack {
                                        Image(systemName: item.selectedIcon)
                                            .imageScale(.medium)
                                            .foregroundStyle(item.selectedColor)
                                        Text(item.name)
                                        
                                    }
                                }}
                            
                        }
                    }.listRowBackground(Color.gray
                        .brightness(0.4))
                    
                    Section("Limits"){
                        ForEach(viewModel.defaultItems) {
                            item in
                            if item.data == "Limit"{
                                NavigationLink{
                                    DefaultGLView(defaultItems: item)
                                } label: {
                                    HStack {
                                        Image(systemName: item.selectedIcon)
                                            .imageScale(.medium)
                                            .foregroundStyle(item.selectedColor)
                                        Text(item.name)
                                        
                                    }
                                }}
                            
                        }
                    }.listRowBackground(Color.gray
                        .brightness(0.4))
                    
                }.scrollContentBackground(.hidden) // HERE
                    .background(.white)
                
          
            
            Button(action: {
                isPresented = true
                
            }, label: {
                Text("Set")
                    .bold()
                    .padding(.horizontal, 100)
                    .padding(.vertical, 15)
                    .foregroundColor(.white)
                    .background(Color.pink)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .shadow(radius: 10)
            })
            
        }
        .padding()
        }  }
}

#Preview {
    OnboardingSecondView()
}

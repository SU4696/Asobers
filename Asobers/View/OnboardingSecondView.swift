//
//  OnboardingSecondView.swift
//  Asobers
//
//  Created by Maryam Vasilehbar on 10/26/23.
//

import SwiftUI

struct OnboardingSecondView: View {
    
    @State private var singleSelection: UUID?
    
    
    var body: some View {
        Text("Let's Start Together!")
            .bold()
            .font(.largeTitle)
            .foregroundStyle(.pink)
            .padding(.top,60)
        
        NavigationView {
            List(selection: $singleSelection) {
                Section(header:
                            Text("Goal")
                    .font(.system(size: 19, weight: .bold))
                    .foregroundStyle(.black)
                )
                {
                    Text("Water")
                }
                
                Section(header:
                            Text("Limits")
                    .font(.system(size: 18, weight: .bold))
                    .foregroundStyle(.black)
                ) {
                    Text("Coffee")
                    Text("Tabacco")
                }
            }
            
        }
        
        Button(action: {
            //going to next page
        } ) {
            Text ("Set")
                .bold()
                .padding(.horizontal, 150)
                .padding(.vertical, 20)
                .foregroundColor(.white)
                .background(Color.pink)
            //change the main color
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .shadow(radius: 10)
            
            
            
        }
    }
}

#Preview {
    OnboardingSecondView()
}

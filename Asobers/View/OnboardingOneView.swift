//
//  OnboardingOne.swift
//  Asobers
//
//  Created by Francesca Pia De Rosa on 23/10/23.
//

import SwiftUI

struct OnboardingOneView: View {
    @Binding var isFirstLaunching: Bool
    @State private var isPresented: Bool = false
    @State private var isTitleVisible = false

    
  
    
    var body: some View {
        VStack {
            Text("Welcome to Well O'Clock!")
                .font(.largeTitle)
                .multilineTextAlignment(.center)
                .bold()
                .foregroundColor(.pink)
                .padding(.bottom, 50)
            
            VStack(alignment:.leading ,spacing: 10) {
                BoxView(icon:"flag.checkered.2.crossed", titletext:"Choose your goal(s)!", description: "Cannot keep track of your good habits alone? Set a goal (or more) and customise as you like!")
                BoxView(icon:"exclamationmark.triangle.fill", titletext:"Reduce your bad habit(s)!", description: "Struggling with your bad habits? Create your personal limit tracker and get rid of them, step by step!")
                BoxView(icon:"chart.bar", titletext:"Set up your activity!", description: "Once your goals and limits are created, you can keep track of your daily progress!")
            }
            
            
            Spacer()
            
            Button(action: {
                isPresented = true
                // lead to next page
            }, label: { Text("Continue")
            }
            )
            .bold()
            .padding(.horizontal, 100)
            .padding(.vertical, 15)
            .foregroundColor(.white)
            .background(Color.pink) //change with main color
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .shadow(radius: 10)
           
            .fullScreenCover(isPresented: $isPresented){
                OnboardingSecondView(isFirstLaunching: $isFirstLaunching)
                
            }
        } .padding(.top, 80)
        .padding()
    }
}


struct BoxView: View {
    var icon: String
    var titletext: String
    var description: String
    
    var body: some View {
        HStack(alignment: .center, spacing: 20) { // 이 부분을 수정함
            Image(systemName: icon)
                .font(.title)
                .frame(width: 15, height: 15)
                .padding()
                .foregroundStyle(.pink)
                
            
            VStack(alignment: .leading) {
                Text(titletext)
                    .bold()
                    .font(.headline)
                    
                
                Text(description)
                    .font(.body)
                
                
            } .fixedSize(horizontal: false, vertical: true)
            
            
        }
        .padding([.leading, .trailing, .bottom])
        
    }
    
    
}
//
//#Preview {
//    OnboardingOneView()
//}

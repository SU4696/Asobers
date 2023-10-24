//
//  OnboardingOne.swift
//  Asobers
//
//  Created by Francesca Pia De Rosa on 23/10/23.
//

import SwiftUI

struct OnboardingOneView: View {
    @State private var isTitleVisible = false
    
    var body: some View {
        VStack {
            Text("Welcome to iRoutine")
                .font(.system(size: 35))
                .bold()
                .foregroundColor(.pink)
                .padding(.bottom, 50)
            
            BoxView(icon:"🤸🏻", titletext:"set up your activity", description: "Activities are nice. After choosing them, you can keep track of your progress!")
            BoxView(icon:"🙆🏻", titletext:"Goals!", description: "Goals will help you become healthy and live a happy life. Choose and do it!")
            BoxView(icon:"🙅🏻", titletext:"Limits!", description: "Choose a bad activity and keep track of it to help yourself let it go step by step!")
            
            Button(action: {
                // lead to next page
            }) {
                Text("Continue")
                    .bold()
                    .padding(.horizontal, 90)
                    .padding(.vertical, 20)
                    .foregroundColor(.white)
                    .background(Color.pink) //change with main color
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .padding(.top, 100)
                    .shadow(radius: 10)
            }
            
            //Button (action: {
            //}) {
            //Text("Bottone o cess")
            // .padding(.horizontal, 20)
            //   .padding(.vertical, 14)
            //   .frame(width: 340, alignment: .center)
            //    .background(Color(red: 1, green: 0.26, blue: 0.47))
            //    .cornerRadius(12)
            //  }
        }
        .padding()
    }
}


struct BoxView: View {
    
    var icon: String
    var titletext: String
    var description: String
    
    var body: some View {
        HStack {
            
            Text(icon)
                .multilineTextAlignment(.leading)
                
            
            VStack{
                
                Text(titletext)
                    .multilineTextAlignment(.leading)
                    .bold()
                Text(description)
                    .multilineTextAlignment(.leading)
            }
            .padding()
        }
        
    }
}

#Preview {
    OnboardingOneView()
}

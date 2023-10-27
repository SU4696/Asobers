//
//  OnboardingOne.swift
//  Asobers
//
//  Created by Francesca Pia De Rosa on 23/10/23.
//

import SwiftUI

struct OnboardingOneView: View {
    //    @Binding var isFirstLaunching: Bool
    @State private var isPresented: Bool = false
    @State private var isTitleVisible = false
    
    var body: some View {
        VStack {
            Text("Welcome to iRoutine")
                .font(.largeTitle)
                .bold()
                .foregroundColor(.pink)
                .padding(.bottom, 50)
            
            VStack(alignment:.leading ,spacing: 10) {
                BoxView(icon:"list.dash", titletext:"Set up your activity", description: "Activities are nice. After choosing them, you can keep track of your progress!")
                BoxView(icon:"list.dash", titletext:"Goals!", description: "Goals will help you become healthy and live a happy life. Choose and do it!")
                BoxView(icon:"list.dash", titletext:"Limits!", description: "Choose a bad activity and keep track of it to help yourself let it go step by step!")
            }
            
            
            Spacer()
            
            Button(action: {
                //                isFirstLaunching.toggle()
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
                OnboardingSecondView()
                
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
        HStack(alignment: .center) { // 이 부분을 수정함
            Image(systemName: icon)
                .font(.title)
                .frame(width: 25, height: 25)
                .padding()
            
            
            VStack(alignment: .leading) {
                Text(titletext)
                    .bold()
                    .font(.headline)
                    .foregroundStyle(.pink)
                
                Text(description)
                    .font(.body)
                
                
            } .fixedSize(horizontal: false, vertical: true)
            
            
        }
        .padding([.leading, .trailing, .bottom])
        
    }
    
    
}

#Preview {
    OnboardingOneView()
}

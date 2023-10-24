//
//  ColorIconSelectorModelView.swift
//  Asobers
//
//  Created by Suyeon Cho on 23/10/23.
//

import SwiftUI




struct ColorIconSelectorModelView: View {
    @State private var screenSelection = 0
    let colors: [Color] = [.red, .orange,  .yellow, .green,.mint,.teal, .cyan, .blue,.indigo, .purple,.pink, .brown, .gray]
    @Binding var selectedColor: Color
    @Binding var selectedIcon: String
    @State private var searchText = ""
    @State var symbols: [String] = []
    
    
    
    let columns = [GridItem(.adaptive(minimum: 33), spacing:10)]
    
    
    @State private var isFirstTimeAppeared = false
   
    
    
    var body: some View {
        VStack {
            
            Picker("Select the screen", selection: $screenSelection) {
                Text("Color").tag(0)
                Text("Icon").tag(1)
            }
            .pickerStyle(.segmented)
            if screenSelection == 0 {
                ScrollView {
                    LazyVGrid(columns:columns){
                        ForEach(colors, id: \.self) { color in
                            ZStack{
                                Image(systemName: selectedColor == color ? Constants.Icons.recordCircleFill: Constants.Icons.circleFill)
                                    .font(.system(size: 35))
                                    .foregroundColor(color)
                                    .clipShape(Circle())
                                    .onTapGesture {
                                        print(color)
                                        selectedColor = color
                                    }
                               
                                
                            }.padding()
                        }}.padding()}
            }
            else{
                ScrollView {
                    SearchBar(searchText: $searchText).padding(.vertical,10)
                    LazyVGrid(columns: [GridItem(.adaptive(minimum: 44))], spacing: 10) {
                        ForEach(symbols.filter{searchText.isEmpty ? true : $0.contains(searchText.lowercased()) }, id: \.hash) { icon in
                            
                            Button {
                                withAnimation {
                                    self.selectedIcon = icon
                                }
                            } label: {
                                SymbolIcon(icon: icon, selection: $selectedIcon)
                            }
                            
                        }.padding(.top, 5)
                    }
                }
            }
            
        }
        .padding(.horizontal,15)
        .padding(.vertical,5)
        .onAppear {
                    if(!isFirstTimeAppeared) {
                        self.loadSymbolsFromSystem()
                    }
                }
        
    }
    func loadSymbolsFromSystem() {
            var symbols = [String]()
            if let bundle = Bundle(identifier: "com.apple.CoreGlyphs"),
               let resourcePath = bundle.path(forResource: "name_availability", ofType: "plist"),
               let plist = NSDictionary(contentsOfFile: resourcePath),
               let plistSymbols = plist["symbols"] as? [String: String]
            {
                symbols = Array(plistSymbols.keys)
            }
            self.symbols = symbols
        }
    
}

#Preview {
    ColorIconSelectorModelView(selectedColor: .constant(.red), selectedIcon: .constant("beats.powerbeatspro"))
}


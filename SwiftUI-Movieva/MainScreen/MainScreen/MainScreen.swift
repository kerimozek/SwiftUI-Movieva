//
//  MainScreen.swift
//  SwiftUI-Movieva
//
//  Created by PSI_ErsanV on 3.02.2023.
//

import SwiftUI

struct MainScreen: View {
    
    var body: some View {
        
        List {
            LazyVStack{
                Section{
                    Text("What do you want to watch")
                        .font(.title2)
                        .foregroundColor(.black)
                        .fontWeight(.medium)
                        .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                }
                .padding(.bottom, 16)
                
                Section{
                    TopSlider()
                }
                .padding(.bottom, 16)
                
                VStack{
                    Section{
                        MainPicker()
                    }
                }
                .frame(height: 600)
            }
        }
        .listStyle(PlainListStyle())
    }
}

struct MainScreen_Previews: PreviewProvider {
    static var previews: some View {
        MainScreen()
    }
}

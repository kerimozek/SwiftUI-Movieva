//
//  MainScreen.swift
//  SwiftUI-Movieva
//
//  Created by PSI_ErsanV on 3.02.2023.
//

import SwiftUI

struct MainScreen: View {
    
    var body: some View {
        
        ScrollView{
            LazyVStack{
                Section{
                    Text("What do you want to watch")
                        .font(.title2)
                        .foregroundColor(.black)
                        .fontWeight(.medium)
                        .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                }
                .padding(16)
                
                Section{
                    TopSlider()
                }
                .padding(.horizontal, 16)
                .padding(.bottom, 8)
                
                VStack{
                    Section{
                        MainPicker()
                    }
                    .padding(8)
                }
                .frame(height: 600)
                .padding(.bottom, 8)
            }
            .padding(.bottom, 20)
        }
        
        
        
        
    }
}

struct MainScreen_Previews: PreviewProvider {
    static var previews: some View {
        MainScreen()
    }
}

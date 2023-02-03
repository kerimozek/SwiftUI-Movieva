//
//  MainScreen.swift
//  SwiftUI-Movieva
//
//  Created by PSI_ErsanV on 3.02.2023.
//

import SwiftUI

struct MainScreen: View {
    
    var body: some View {
        
        
        
        GeometryReader { geometry in
            VStack{
                Text("What do you want to watch")
                
                VStack{
                    TopSlider()
                    
                    MainPicker()
                        .padding(.bottom, 16)
                }
                .frame(height: geometry.size.height)
               
            }
        }
    }
}

struct MainScreen_Previews: PreviewProvider {
    static var previews: some View {
        MainScreen()
    }
}

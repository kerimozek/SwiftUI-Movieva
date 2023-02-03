//
//  MainScreen.swift
//  SwiftUI-API-Call-Decode-JSON
//
//  Created by PSI_ErsanV on 2.02.2023.
//

import SwiftUI

struct MainScreen: View {
    
    let colors = [Color.red, Color.green, Color.blue, Color.orange, Color.pink]

    var body: some View {
      
            GeometryReader { geometry in
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack() {
                        ForEach(self.colors, id: \.self) { color in
                            Rectangle()
                                .fill(color)
                                .frame(width: geometry.size.width / 1.3, height: geometry.size.height / 4)
                        }
                    }
                    .padding(.horizontal, 12)
                }
            }
        
        
    }
}

struct MainScreen_Previews: PreviewProvider {
    static var previews: some View {
        MainScreen()
    }
}

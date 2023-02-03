//
//  MainScreen.swift
//  SwiftUI-API-Call-Decode-JSON
//
//  Created by PSI_ErsanV on 2.02.2023.
//

import SwiftUI

struct TopSlider: View {
    
    let images = ["mikasa", "ereh", "levi", "mikasa", "ereh", "levi"]
    let colors = [Color.red, Color.green, Color.blue, Color.orange, Color.pink]
    
    var body: some View {
        
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(alignment: .center, spacing: 12) {
                ForEach(images, id: \.self) { image in
                    Image(image)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 200)
                        .cornerRadius(12)
                }
            }
        }
       
    }
}


struct TopSlider_Previews: PreviewProvider {
    static var previews: some View {
        TopSlider()
    }
}

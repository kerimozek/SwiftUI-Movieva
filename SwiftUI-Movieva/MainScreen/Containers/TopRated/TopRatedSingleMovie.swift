//
//  TopRatedSingleMovie.swift
//  SwiftUI-Movieva
//
//  Created by PSI_ErsanV on 21.02.2023.
//

import SwiftUI

struct TopRatedSingleMovie: View {
  
    var body: some View {
        VStack(alignment: .leading) {
        
            Text("kerrami")
                .font(.headline)
                .foregroundColor(.primary)
                .lineLimit(2)
                .padding(.top, 8)
        }
    }
}

struct TopRatedSingleMovie_Previews: PreviewProvider {
    static var previews: some View {
        TopRatedSingleMovie()
    }
}

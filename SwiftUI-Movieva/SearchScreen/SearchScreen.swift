//
//  SearchScreen.swift
//  SwiftUI-API-Call-Decode-JSON
//
//  Created by PSI_ErsanV on 2.02.2023.
//

import SwiftUI

struct SearchScreen: View {
    var body: some View {
        Text("Search Screen")
            .bold()
            .fontWeight(.black)
            .foregroundColor(.white)
            .padding()
            .background(Color(.systemBlue))
            .cornerRadius(10)
    }
}

struct SearchScreen_Previews: PreviewProvider {
    static var previews: some View {
        SearchScreen()
    }
}

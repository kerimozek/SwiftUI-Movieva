//
//  WatchList.swift
//  SwiftUI-API-Call-Decode-JSON
//
//  Created by PSI_ErsanV on 2.02.2023.
//

import SwiftUI

struct WatchList: View {
    
    var body: some View {
        
        Text("WatchList")
            .bold()
            .fontWeight(.black)
            .foregroundColor(.white)
            .padding()
            .background(Color(.systemRed))
            .cornerRadius(10)
            
    }
}

struct WatchList_Previews: PreviewProvider {
    static var previews: some View {
        WatchList()
    }
}

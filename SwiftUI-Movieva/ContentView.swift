//
//  ContentView.swift
//  SwiftUI-API-Call-Decode-JSON
//
//  Created by PSI_ErsanV on 2.02.2023.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        
     
            TabView{
                MainScreen()
                    .tabItem {
                        Image(systemName: "house")
                    }
                    .padding(.top, 100)
                SearchScreen()
                    .tabItem {
                        Image(systemName: "magnifyingglass")
                    }
                WatchList()
                    .tabItem {
                        Image(systemName: "bookmark")
                    }
            }
              
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

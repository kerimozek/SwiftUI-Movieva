//
//  MainPicker.swift
//  SwiftUI-Movieva
//
//  Created by PSI_ErsanV on 3.02.2023.
//

import SwiftUI

struct MainPicker: View {
    
    @StateObject private var vm = MovieViewModel()
    
    var views = ["Latest", "Upcoming", "TopRated"]
    
    @State private var selectedView = 0
    
    var body: some View {
        
        VStack {
            Picker(selection: $selectedView, label: Text("Select a view")) {
                ForEach(0..<views.count, id: \.self) {
                    Text(self.views[$0]).tag($0)
                }
            }
            .pickerStyle(SegmentedPickerStyle())
            
            if selectedView == 0 {
                LatestView()
            } else if selectedView == 1 {
                UpcomingView()
            } else {
                TopRatedView()
            }
        }
    }
}

struct MainPicker_Previews: PreviewProvider {
    static var previews: some View {
        MainPicker()
    }
}

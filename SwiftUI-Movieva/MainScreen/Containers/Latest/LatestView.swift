//
//  UpcomingView.swift
//  SwiftUI-Movieva
//
//  Created by PSI_ErsanV on 3.02.2023.
//


import SwiftUI

struct LatestView: View {
    
    @StateObject private var vm = MovieViewModel()
    
    var body: some View {
        
        ScrollView(.vertical, showsIndicators: false) {
            LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: 3), spacing: 12) {
                ForEach(vm.movies ?? vm.placeholders, id: \.id) { item in
                    NavigationLink(
                        destination: DetailScreen(item: item),
                        label: {
                            LatestSingleMovie(item: item)
                                .id(item.originalTitle) // provide a unique identifier
                        })
                }
            }
            .padding(.horizontal)
            .onAppear(perform: vm.fetchMovies)
        }
    }
}


struct LatestView_Previews: PreviewProvider {
    static var previews: some View {
        LatestView()
    }
}


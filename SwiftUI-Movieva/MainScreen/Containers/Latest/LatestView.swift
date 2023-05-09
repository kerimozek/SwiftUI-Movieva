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
                ForEach(vm.movies.indices, id: \.self) { index in
                    let item = vm.movies[index]
                    NavigationLink(
                        destination: DetailScreen(item: item),
                        label: {
                            LatestSingleMovie(item: item)
                                .id(item.originalTitle) // provide a unique identifier
                        })
                    
                    if index == vm.movies.count - 1 {
                        ProgressView()
                            .onAppear {
                                if !vm.fetchNextPage {
                                    vm.fetchNextPage = true
                                    vm.fetchMovies(shouldLoadNextPage: true)
                                }
                            }
                            .onDisappear {
                                vm.fetchNextPage = false
                            }
                    }
                }
            }
            .padding(.horizontal)
        }
        .onAppear {
            vm.fetchMovies()
        }
        .onDisappear {
            vm.resetMovies()
        }
    }
}


struct LatestView_Previews: PreviewProvider {
    static var previews: some View {
        LatestView()
    }
}


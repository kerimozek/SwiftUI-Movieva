//
//  UpcomingView.swift
//  SwiftUI-Movieva
//
//  Created by PSI_ErsanV on 3.02.2023.
//

import SwiftUI

struct LatestView: View {
    @StateObject private var vm = MovieViewModel()
    @State private var isShowingProgressView = false
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: true) {
            LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: 3), spacing: 12) {
                ForEach(vm.movies.indices, id: \.self) { index in
                    let item = vm.movies[index]
                    NavigationLink(
                        destination: DetailScreen(item: item),
                        label: {
                            LatestSingleMovie(item: item)
                                .id(item.originalTitle) // provide a unique identifier
                        })
                        .onAppear {
                            if index == vm.movies.count - 1 {
                                if vm.movies.count < 99 {
                                    fetchNextPageWithDelay()
                                }
                            }
                        }
                }
                
                if isShowingProgressView && vm.movies.count < 99 {
                    ProgressView()
                        .padding(.vertical, 20)
                        .onAppear {
                            // Simulate delay of 0.5 seconds before fetching the next page
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                                vm.fetchNextPage()
                            }
                        }
                }
            }
            .padding(.horizontal)
        }
        .onAppear {
            vm.fetchMovies()
        }
    }
    
    private func fetchNextPageWithDelay() {
        isShowingProgressView = true
    }
}

struct LatestView_Previews: PreviewProvider {
    static var previews: some View {
        LatestView()
    }
}









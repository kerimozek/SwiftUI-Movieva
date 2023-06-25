//
//  SearchScreen.swift
//  SwiftUI-API-Call-Decode-JSON
//
//  Created by PSI_ErsanV on 2.02.2023.
//

import SwiftUI

struct SearchScreen: View {
    @StateObject private var vm = MovieViewModel()
    
    var body: some View {
        VStack{
//            ScrollView(.vertical, showsIndicators: false) {
//                LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: 3), spacing: 12) {
//                    ForEach(vm.movies.indices, id: \.self) { index in
//                        let item = vm.movies[index]
//                        NavigationLink(
//                            destination: DetailScreen(item: item),
//                            label: {
//                                LatestSingleMovie(item: item)
//                                    .id(item.originalTitle) // provide a unique identifier
//                            })
//                        
//                        if index == vm.movies.count - 1 {
//                            ProgressView()
//                                .onAppear {
//                                    if !vm.fetchNextPage {
//                                        vm.fetchNextPage = true
//                                        vm.fetchMovies(shouldLoadNextPage: true)
//                                    }
//                                }
//                                .onDisappear {
//                                    vm.fetchNextPage = false
//                                }
//                        }
//                    }
//                }
//                .padding(16)
//            }
            VStack{
                Text("HHHHHH")
            }
            .padding(.top, 200)
        }
        
        .onAppear {
            vm.fetchMovies()
        }
        .onDisappear {
            vm.resetMovies()
        }
    }
}


struct SearchScreen_Previews: PreviewProvider {
    static var previews: some View {
        SearchScreen()
    }
}

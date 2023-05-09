//
//  UpcomingView.swift
//  SwiftUI-Movieva
//
//  Created by PSI_ErsanV on 3.02.2023.
//

//import SwiftUI
//
//struct UpcomingView: View {
//
//    @StateObject private var vm = MovieViewModel()
//
//    var body: some View {
//        ScrollView(.vertical, showsIndicators: false) {
//            LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: 3), spacing: 12) {
//                ForEach(vm.movies.indices, id: \.self) { index in
//                    let item = vm.movies[index]
//                    NavigationLink(
//                        destination: DetailScreen(item: item),
//                        label: {
//                            UpcomingSingleMovie(item: item)
//                        })
//                        .id(item.id)
//
//                    if index == vm.movies.count - 1 {
//                        ProgressView()
//                            .onAppear {
//                                vm.fetchUpcomingMovies(shouldLoadNextPage: true)
//                            }
//                    }
//                }
//            }
//            .padding(.horizontal)
//            .onAppear {
//                vm.fetchUpcomingMovies()
//            }
//        }
//    }
//}
//
//
//
//struct UpcomingView_Previews: PreviewProvider {
//    static var previews: some View {
//        UpcomingView()
//    }
//}

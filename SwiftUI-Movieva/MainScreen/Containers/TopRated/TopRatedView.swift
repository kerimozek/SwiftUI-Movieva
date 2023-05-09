//
//  TopRated.swift
//  SwiftUI-Movieva
//
//  Created by PSI_ErsanV on 3.02.2023.
//

//import SwiftUI
//import SDWebImageSwiftUI
//
//struct TopRatedView: View {
//
//    @StateObject private var vm = MovieViewModel()
//
//    var body: some View {
//        ScrollView {
//            LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: 3), spacing: 20) {
//                ForEach(vm.movies.indices, id: \.self) { index in
//                    let movie = vm.movies[index]
//                    WebImage(url: URL(string: "https://image.tmdb.org/t/p/w500\(movie.posterPath ?? "")"))
//                        .resizable()
//                        .placeholder {
//                            ProgressView()
//                                .frame(width: 80, height: 80)
//                                .progressViewStyle(CircularProgressViewStyle())
//                        }
//                        .indicator(.activity)
//                        .transition(.fade(duration: 0.5))
//                        .scaledToFit()
//                        .frame(width: 120)
//                        .cornerRadius(10)
//
//                    if index == vm.movies.count - 1 {
//                        ProgressView()
//                            .onAppear(perform: {
//                                vm.fetchMovies(shouldLoadNextPage: true)
//                            })
//                    }
//                }
//            }
//            .padding(.horizontal)
//            .onAppear {
//                            vm.fetchMovies()
//                        }
//        }
//    }
//}
//
//
//
//
//struct TopRated_Previews: PreviewProvider {
//    static var previews: some View {
//        TopRatedView()
//    }
//}

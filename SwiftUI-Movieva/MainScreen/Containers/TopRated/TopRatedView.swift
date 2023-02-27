//
//  TopRated.swift
//  SwiftUI-Movieva
//
//  Created by PSI_ErsanV on 3.02.2023.
//

import SwiftUI
import SDWebImageSwiftUI

struct TopRatedView: View {
    
    @State private var movies = [ResultMovie]()
    @State private var isLoading = false
    @StateObject private var vm = MovieViewModel()
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: 3), spacing: 20) {
                ForEach(vm.movies ?? vm.placeholders, id: \.id) { movie in
                    WebImage(url: URL(string: "https://image.tmdb.org/t/p/w500\(movie.posterPath ?? "")"))
                        .resizable()
                        .placeholder {
                            ProgressView()
                                .frame(width: 80, height: 80)
                                .progressViewStyle(CircularProgressViewStyle())
                        }
                        .indicator(.activity)
                        .transition(.fade(duration: 0.5))
                        .scaledToFit()
                        .frame(width: 120)
                        .cornerRadius(10)
                }
            }
            .padding()
        }
        .onAppear(perform: vm.fetchUpcomingMovies)
    }
}


struct TopRated_Previews: PreviewProvider {
    static var previews: some View {
        TopRatedView()
    }
}

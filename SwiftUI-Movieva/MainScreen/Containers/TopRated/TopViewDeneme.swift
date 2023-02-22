//
//  TopViewDeneme.swift
//  SwiftUI-Movieva
//
//  Created by PSI_ErsanV on 22.02.2023.
//

import SwiftUI

struct TopViewDeneme: View {
    @State private var movies = [ResultMovie]()
    @State private var isLoading = false
    @StateObject private var vm = MovieViewModel()
    
    var body: some View {
        VStack {
            if isLoading {
                ProgressView()
            } else {
                
                List(movies, id: \.id) { movie in
                    Text(movie.title ?? "")
                }
                .listStyle(.plain)
                .padding()
            }
        }
        .onAppear {
            isLoading = true
            PopularManager.shared.getPopular(page: 1) { results, error in
                if let results = results {
                    isLoading = false
                    movies = results
                } else if let error = error {
                    isLoading = false
                    print(error)
                }
            }
        }
    }
}

struct TopViewDeneme_Previews: PreviewProvider {
    static var previews: some View {
        TopViewDeneme()
    }
}

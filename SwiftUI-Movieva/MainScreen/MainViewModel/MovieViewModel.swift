//
//  MovieModel.swift
//  SwiftUI-Movieva
//
//  Created by PSI_ErsanV on 13.02.2023.
//

import SwiftUI

class MovieViewModel: ObservableObject {
    @Published var movies: [ResultMovie] = []
    @Published var fetchNextPage = false
    private var currentPage = 1
    private var isFetching = false
    
    func fetchMovies(shouldLoadNextPage: Bool = false) {
        guard !isFetching else { return }
        isFetching = true
        let urlString = APIURLs.popularMovies(page: currentPage)
        guard let url = URL(string: urlString) else { return }
        
        NetworkManager.shared.request(type: Movie.self, url: url, method: .get) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let movie):
                DispatchQueue.main.async {
                    if shouldLoadNextPage {
                        self.movies += movie.results ?? []
                    } else {
                        self.movies = movie.results ?? []
                    }
                    self.currentPage += 1
                    self.isFetching = false
                }
            case .failure(let error):
                print("Error: \(error.localizedDescription)")
                self.isFetching = false
            }
        }
    }
    
    func nextPage() {
        fetchMovies(shouldLoadNextPage: true)
    }
    
    func resetMovies() {
        movies.removeAll()
        currentPage = 1
        isFetching = false
    }
}





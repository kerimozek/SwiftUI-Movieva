//
//  MovieModel.swift
//  SwiftUI-Movieva
//
//  Created by PSI_ErsanV on 13.02.2023.
//

import SwiftUI

class MovieViewModel: ObservableObject {
    @Published var movies: [ResultMovie] = []
    @Published var isFetchingNextPage = false
    private var currentPage = 1
    private var isFetching = false
    
    func fetchMovies() {
        guard !isFetching else { return }
        isFetching = true
        let urlString = APIURLs.popularMovies(page: currentPage)
        guard let url = URL(string: urlString) else { return }
        
        NetworkManager.shared.request(type: Movie.self, url: url, method: .get) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let movie):
                DispatchQueue.main.async {
                    if let newMovies = movie.results {
                        let combinedMovies = self.movies + newMovies
                        self.movies = Array(combinedMovies.prefix(99)) // Sınırlamayı burada yaparız
                    }
                    self.currentPage = 2
                    self.isFetching = false
                }
            case .failure(let error):
                print("Error: \(error.localizedDescription)")
                self.isFetching = false
            }
        }
    }
    
    func fetchNextPage() {
        guard !isFetchingNextPage && !isFetching && movies.count < 99 else { return } // 99 film sınırlaması ekledik
        isFetchingNextPage = true
        let urlString = APIURLs.popularMovies(page: currentPage)
        guard let url = URL(string: urlString) else { return }
        
        NetworkManager.shared.request(type: Movie.self, url: url, method: .get) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let movie):
                DispatchQueue.main.async {
                    if let newMovies = movie.results {
                        let combinedMovies = self.movies + newMovies
                        self.movies = Array(combinedMovies.prefix(99)) // Sınırlamayı burada yaparız
                    }
                    self.currentPage += 1
                    self.isFetchingNextPage = false
                }
            case .failure(let error):
                print("Error: \(error.localizedDescription)")
                self.isFetchingNextPage = false
            }
        }
    }
    
    func resetMovies() {
        movies.removeAll()
        currentPage = 1
        isFetching = false
    }
}







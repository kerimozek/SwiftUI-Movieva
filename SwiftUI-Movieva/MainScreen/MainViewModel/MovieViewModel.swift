//
//  MovieModel.swift
//  SwiftUI-Movieva
//
//  Created by PSI_ErsanV on 13.02.2023.
//

import SwiftUI

class MovieViewModel: ObservableObject {
    @Published var movies: [ResultMovie]?
    
    public var placeholders = Array(repeating: ResultMovie(adult: nil, backdropPath: nil, genreIDS: nil, id: 1, originalLanguage: nil, originalTitle: nil, overview: nil, popularity: nil, posterPath: nil, releaseDate: nil, title: nil, video: nil, voteAverage: nil, voteCount: nil), count: 10)
    
    func fetchMovies() {
        let usersUrlString = "https://api.themoviedb.org/3/movie/popular?api_key=fd24fe5ba58021d3f54a2a7c04297951&language=en-US"
        let url = URL(string: usersUrlString)
        
        var request = URLRequest(url: url!)
        request.httpMethod = "GET"
        
        URLSession.shared.dataTask(with: request) { [weak self] (data, response, error) in
            if let error = error {
                print("error: \(error.localizedDescription)")
            } else {
                guard let data = data else { return }
                
                do {
                    let result = try JSONDecoder().decode(Movie.self, from: data)
                    DispatchQueue.main.async {
                        self?.movies = result.results
                    }
                } catch {
                    print("error: \(error.localizedDescription)")
                }
            }
        }.resume()
    }
}



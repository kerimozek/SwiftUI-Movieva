//
//  MovieModel.swift
//  SwiftUI-Movieva
//
//  Created by PSI_ErsanV on 13.02.2023.
//

import Foundation

final class MovieViewModel: ObservableObject {
    
    @Published var movies: [Movie] = []
    
    func fetchMovies() {
        
        let usersUrlString = "https://api.themoviedb.org/3/movie/popular?api_key=fd24fe5ba58021d3f54a2a7c04297951&language=en-US&page=1"
        if let url = URL(string: usersUrlString) {
            
            URLSession
                .shared
                .dataTask(with: url) { [weak self] data, response, error in
                    // TODO: Handle returning data on the main thread
                    
                    DispatchQueue.main.async {
                        
                        if let error = error {
                            // TODO: Handle error
                            print(error)
                            
                        } else {
                            
                            let decoder = JSONDecoder()
                            decoder.keyDecodingStrategy = .convertFromSnakeCase
                            
                            if let data = data,
                               let movies = try? decoder.decode([Movie].self, from: data) {
                                // TODO: Handle setting the data
                                
                                self?.movies = movies
                                
                            } else {
                                // TODO: Handle error
                            }
                        }
                    }
                        
                    }.resume()
                
        }
    }
}

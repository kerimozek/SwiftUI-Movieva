//
//  MovieDetailViewModel.swift
//  SwiftUI-Movieva
//
//  Created by PSI_ErsanV on 16.02.2023.
//

import SwiftUI

class MovieDetailViewModel: ObservableObject {
    
    @Published var movies: ResultMovie?
    
    func fetchData(id: Int) {
        
        let url = URL(string: "https://api.themoviedb.org/3/movie/\(id)?api_key=fd24fe5ba58021d3f54a2a7c04297951&language=en-US")
        
        var request = URLRequest(url: url!)
        request.httpMethod = "GET"
        
        URLSession.shared.dataTask(with: request) { [weak self] (data, response, error) in
            if let error = error {
                print("error: \(error.localizedDescription)")
            } else {
                guard let data = data else { return }
                
                do {
                    let result = try JSONDecoder().decode(ResultMovie.self, from: data)
                    DispatchQueue.main.async {
                        self?.movies = result
                    }
                } catch {
                    print("error: \(error.localizedDescription)")
                }
            }
        }.resume()
    }
}

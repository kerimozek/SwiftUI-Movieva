//
//  PopularManager.swift
//  SwiftUI-Movieva
//
//  Created by PSI_ErsanV on 21.02.2023.
//

import Foundation

class PopularManager {
    
    static let shared = PopularManager()
    
    func getPopular(page: Int, complete: @escaping(([ResultMovie]?, String?)->())) {
        
        let url = APIURLs.popularMovies(page: page)
        let urlString = URL(string: url)
        
        NetworkManager.shared.request(type: Movie.self,
                                      url: urlString!,
                                      method: .get) { response in
            switch response {
            case .success(let movie):
                complete(movie.results, nil)
            case .failure(let error):
                complete(nil, error.localizedDescription)
            }
        }
    }
}

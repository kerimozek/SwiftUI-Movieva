//
//  MainViewModel.swift
//  SwiftUI-Movieva
//
//  Created by PSI_ErsanV on 10.02.2023.
//

import Foundation

final class MainViewModel: ObservableObject {
    
    @Published var photos: [Photos] = []
    
    func fetchPhotos() {
        
        let usersUrlString = "https://jsonplaceholder.typicode.com/photos"
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
                               let photos = try? decoder.decode([Photos].self, from: data) {
                                // TODO: Handle setting the data
                                
                                self?.photos = photos
                                
                            } else {
                                // TODO: Handle error
                            }
                        }
                    }
                        
                    }.resume()
                
        }
    }
}

//
//  denemeViewModel.swift
//  SwiftUI-Movieva
//
//  Created by PSI_ErsanV on 13.02.2023.
//

import Foundation

final class DenemeViewModel: ObservableObject {
    
    @Published var users: [User] = []
    
    func fetchUsers() {
        
        let usersUrlString = "https://jsonplaceholder.typicode.com/users"
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
                               let users = try? decoder.decode([User].self, from: data) {
                                // TODO: Handle setting the data
                                
                                self?.users = users
                                
                            } else {
                                // TODO: Handle error
                            }
                        }
                    }
                    
                }.resume()
        }
    }
}

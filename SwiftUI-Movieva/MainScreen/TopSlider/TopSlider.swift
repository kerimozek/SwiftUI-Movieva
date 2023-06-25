//
//  TopSlider2.swift
//  SwiftUI-Movieva
//
//  Created by PSI_ErsanV on 15.05.2023.
//

import SwiftUI

struct TopSlider: View {
    
    @StateObject private var vm = MovieViewModel()
    
    var body: some View {
        
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 12) {
                ForEach(vm.movies.indices, id: \.self) { index in
                    let item = vm.movies[index]
                    NavigationLink(
                        destination: DetailScreen(item: item),
                        label: {
                            TopSliderSingle(item: item)
                        })
                }
            }
        }
        .onAppear {
            vm.fetchMovies()
        }

    }
}

struct TopSlider_Previews: PreviewProvider {
    static var previews: some View {
        TopSlider()
    }
}

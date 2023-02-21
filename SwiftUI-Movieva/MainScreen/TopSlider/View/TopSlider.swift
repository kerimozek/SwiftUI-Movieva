//
//  MainScreen.swift
//  SwiftUI-API-Call-Decode-JSON
//
//  Created by PSI_ErsanV on 2.02.2023.
//

import SwiftUI
import SDWebImageSwiftUI

struct TopSlider: View {
    
    @ObservedObject private var vm = MovieViewModel()
    
    var body: some View {
        
        NavigationView {
            VStack {
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 12) {
                        ForEach(vm.movies ?? vm.placeholders, id: \.id) { item in
                            NavigationLink(
                                destination: DetailScreen(item: item),
                                label: {
                                    TopSliderSingle(item: item)
                                })
                        }
                    }
                }
            }
            .onAppear {
                vm.fetchMovies()
            }
        }
    }
}


struct TopSliderSingle: View {
    
    var item: ResultMovie
    
    var body: some View {
        VStack {
            WebImage(url: URL(string: "https://image.tmdb.org/t/p/w500\(item.backdropPath ?? "")"))
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 350, height: 250)
                .redacted(reason: item.posterPath == nil ? .placeholder : .init())
                .cornerRadius(12)
        }
    }
}


struct TopSlider_Previews: PreviewProvider {
    static var previews: some View {
        TopSlider()
    }
}

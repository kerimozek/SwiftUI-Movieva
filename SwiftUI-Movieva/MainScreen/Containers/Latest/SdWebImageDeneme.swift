//
//  SdWebImageDeneme.swift
//  SwiftUI-Movieva
//
//  Created by PSI_ErsanV on 15.02.2023.
//

import SwiftUI
import SDWebImageSwiftUI

struct SdWebImageDeneme: View {
    
    var item: ResultMovie
    
    var body: some View {
        VStack{
            WebImage(url: URL(string: "https://image.tmdb.org/t/p/w200/2g9ZBjUfF1X53EinykJqiBieUaO.jpg"))
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 200)
                .cornerRadius(12)
        }
        
    }
}

struct SdWebImageDeneme_Previews: PreviewProvider {
    static var previews: some View {
        SdWebImageDeneme(item: ResultMovie(adult: nil, backdropPath: nil, genreIDS: nil, id: 1, originalLanguage: nil, originalTitle: nil, overview: nil, popularity: nil, posterPath: nil, releaseDate: nil, title: nil, video: nil, voteAverage: nil, voteCount: nil))
    }
}

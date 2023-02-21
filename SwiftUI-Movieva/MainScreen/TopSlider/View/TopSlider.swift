//
//  MainScreen.swift
//  SwiftUI-API-Call-Decode-JSON
//
//  Created by PSI_ErsanV on 2.02.2023.
//

import SwiftUI
import SDWebImageSwiftUI


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


struct TopSliderSingle_Previews: PreviewProvider {
    static var previews: some View {
        TopSliderSingle(item: ResultMovie(adult: true,
                                                 backdropPath: "/xDMIl84Qo5Tsu62c9DGWhmPI67A.jpg",
                                                 genreIDS: [28,12,878],
                                                 id: 505642,
                                                 originalLanguage: "en",
                                                 originalTitle: "Black Panther: Wakanda Forever",
                                                 overview: "Queen Ramonda, Shuri, M’Baku, Okoye and the Dora Milaje fight to protect their nation from intervening world powers in the wake of King T’Challa’s death.  As the Wakandans strive to embrace their next chapter, the heroes must band together with the help of War Dog Nakia and Everett Ross and forge a new path for the kingdom of Wakanda.",
                                                 popularity: 4646.778,
                                                 posterPath: "/sv1xJUazXeYqALzczSZ3O6nkH75.jpg",
                                                 releaseDate: "2022-11-09",
                                                 title: "Black Panther: Wakanda Forever",
                                                 video: false,
                                                 voteAverage: 7.5,
                                                 voteCount: 3132))
    }
}

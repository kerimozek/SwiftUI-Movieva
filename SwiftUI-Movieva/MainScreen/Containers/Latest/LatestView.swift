//
//  LatestView.swift
//  SwiftUI-Movieva
//
//  Created by PSI_ErsanV on 3.02.2023.
//

import SwiftUI

struct LatestView: View {

    @State private var imageData: Data?
    

    let movies: Movie

    //    let images = ["mikasa", "ereh", "levi", "mikasa", "ereh", "levi"]


    var body: some View {

        VStack {
            if let data = imageData {
                Image(uiImage: UIImage(data: data)!)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 200)
                    .cornerRadius(12)
            } else {
                Text("Loading image...")
            }
        }
        .onAppear {
            self.loadImage()
        }
    }

    private func loadImage() {
        guard let url = URL(string: "https://image.tmdb.org/t/p/w200\(String(describing: movies.results?.first?.poster_path))") else {
            return
        }

        DispatchQueue.global().async {
            if let data = try? Data(contentsOf: url) {
                DispatchQueue.main.async {
                    self.imageData = data
                }
            }
        }
    }
}

struct LatestView_Previews: PreviewProvider {
    static var previews: some View {
        LatestView(movies: Movie(page: 1, results: [ResultMovie(adult: false, backdrop_path: "path", genre_ids: [1, 2], id: 1, original_language: "en", original_title: "Title", overview: "Overview", popularity: 10.0, poster_path: "pFlaoHTZeyNkG83vxsAJiGzfSsa", release_date: "2022-02-14", title: "Title", video: false, vote_average: 8.0, vote_count: 100)]))
    }
}





//    var body: some View {
//        GeometryReader { geometry in
//                    ScrollView {
//                        VStack(spacing: 20) {
//                            ForEach(0..<6) { index in
//                                HStack(spacing: 20) {
//                                    ForEach(0..<3) { columnIndex in
//                                        Image("levi")
//                                            .resizable()
//                                            .aspectRatio(contentMode: .fill)
//                                            .frame(height: 150)
//                                            .padding(6)
//                                            .background(Color.red)
//                                            .cornerRadius(8)
//                                    }
//                                }
//                            }
//                        }
//                        .padding()
//                    }
//                    .frame(width: geometry.size.width, height: geometry.size.height, alignment: .center)
//                }
//            }
//        }

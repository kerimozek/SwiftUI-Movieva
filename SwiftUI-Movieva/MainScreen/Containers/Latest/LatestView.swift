import SwiftUI
import SDWebImageSwiftUI

struct LatestView: View {
    
    @ObservedObject private var vm = MovieViewModel()
    
    var body: some View {
        
        VStack {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 12) {
                    ForEach(vm.movies ?? vm.placeholders, id: \.id) { item in
                        LatestSingleMovie(item: item)
                    }
                }
            }
        }
        .onAppear {
            vm.fetchMovies()
        }
    }
}


struct LatestSingleMovie: View {
    
    var item: ResultMovie
    
    var body: some View {
        VStack {
            WebImage(url: URL(string: "https://image.tmdb.org/t/p/w500\(item.posterPath ?? "")"))
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 200)
                .redacted(reason: item.posterPath == nil ? .placeholder : .init())
                .cornerRadius(12)
        }
    }
}


struct LatestView_Previews: PreviewProvider {
    static var previews: some View {
        LatestView()
    }
}

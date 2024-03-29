//
//  DetailScreen.swift
//  SwiftUI-Movieva
//
//  Created by PSI_ErsanV on 16.02.2023.
//

import SwiftUI
import SDWebImageSwiftUI
import SDWebImage

struct DetailScreen: View {
    
    var item: ResultMovie
    @ObservedObject private var viewModel = MovieDetailViewModel()
    @Environment(\.presentationMode) var presentation
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false, content: {
            VStack(alignment: .leading) {
                WebImage(url: URL(string: "https://image.tmdb.org/t/p/original\(item.backdropPath ?? "")"))
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height / 2)
                    .clipped()
                    .overlay(
                        VStack(alignment: .leading, spacing: 8) {
                            HStack {
                                Button(action: {
                                    presentation.wrappedValue.dismiss()
                                }, label: {
                                    Image(systemName: "arrow.left")
                                        .font(.system(size: 32))
                                        .foregroundColor(Color(UIColor.yellow))
                                        .shadow(color: Color.black, radius: 2)
                                })

                            }
                            .padding(.horizontal)
                            .padding(.top, 40)
                            
                            Spacer()
                            
                            Text(item.title ?? "Loading...")
                                .font(.title)
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                                .padding(.horizontal)
                            
                            Text("154 Min")
                                .font(.system(size: 15))
                                .foregroundColor(.gray)
                                .padding(.horizontal)
                                
                            HStack(spacing: 8) {
                                
                                    Text("Adventure")
                                        .font(.system(size: 15))
                                        .foregroundColor(.gray)
                                        .padding(.bottom, 10)
                                   
                                Spacer()
                            }
                            .padding(.horizontal)
                        }
                        .background(LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.124825187, green: 0.1294132769, blue: 0.1380611062, alpha: 1)), Color.clear]), startPoint: .bottom, endPoint: .top))
                    )
                    .id(item.id ?? 0)
                
                Text(viewModel.movies?.overview ?? "Loading...")
                    .foregroundColor(.white)
                    .redacted(reason: viewModel.movies?.overview == nil ? .placeholder : .init())
                    .padding()
                
                Spacer()
            }
        })
        .navigationBarTitle("")
        .navigationBarHidden(true)
        .background(LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)), Color.clear]), startPoint: .bottom, endPoint: .top))
        .ignoresSafeArea(.all, edges: .all)
        .onAppear {
            viewModel.fetchData(id: item.id!)
        }
        .id(item.title)
    }
}



struct DetailScreen_Previews: PreviewProvider {
    static var previews: some View {
        DetailScreen(item: ResultMovie(adult: true,
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

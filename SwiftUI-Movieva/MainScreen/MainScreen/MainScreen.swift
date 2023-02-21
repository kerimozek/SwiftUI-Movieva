import SwiftUI

struct MainScreen: View {
    
    @StateObject private var vm = MovieViewModel()
    
    var body: some View {
        
        NavigationView{
            ScrollView {
                ZStack{
                    VStack(){
                        Section{
                            Text("What do you want to watch")
                                .font(.title2)
                                .foregroundColor(.black)
                                .fontWeight(.medium)
                                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                        }
                        .padding(16)
                        
                        Section{
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
                        .padding(.horizontal, 16)
                        .padding(.bottom, 8)
                        
                        VStack{
                            Section{
                                MainPicker()
                            }
                            .padding(8)
                        }
                        .frame(height: 600)
                        .padding(.bottom, 8)
                    }
                    .padding(.bottom, 20)
                }
                .onAppear(perform: vm.fetchMovies)
            }
        }
    }
}


struct MainScreen_Previews: PreviewProvider {
    static var previews: some View {
        MainScreen()
    }
}

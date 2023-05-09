import SwiftUI

struct MainScreen: View {
    
    @StateObject private var vm = MovieViewModel()
    
    var body: some View {
        
        NavigationView {
            ScrollView {
                ZStack {
                    VStack {
                        Section {
                            Text("What do you want to watch")
                                .font(.title2)
                                .foregroundColor(.black)
                                .fontWeight(.medium)
                                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                        }
                        .padding(16)
                        
                        Section {
                            ScrollView(.horizontal, showsIndicators: false) {
                                HStack(spacing: 12) {
                                    ForEach(vm.movies.indices, id: \.self) { index in
                                        let item = vm.movies[index]
                                        NavigationLink(
                                            destination: DetailScreen(item: item),
                                            label: {
                                                TopSliderSingle(item: item)
                                            })
                                        
                                        if index == vm.movies.count - 1 {
                                            ProgressView()
                                                .onAppear {
                                                    if !vm.fetchNextPage {
                                                        vm.fetchNextPage = true
                                                        vm.nextPage()
                                                    }
                                                }
                                                .onDisappear {
                                                    vm.fetchNextPage = false
                                                }
                                        }
                                    }
                                }
                            }
                            .padding(.horizontal, 16)
                            .padding(.bottom, 8)
                            .onDisappear {
                                vm.resetMovies()
                            }
                            
                            VStack {
                                Section {
                                    MainPicker()
                                }
                                .padding(8)
                            }
                            .frame(height: 600)
                            .padding(.bottom, 8)
                        }
                        .padding(.bottom, 20)
                    }
                    .onAppear {
                        vm.fetchMovies()
                    }
                    .onDisappear {
                        vm.resetMovies()
                    }
                }
            }
        }
    }
    
}
    
    struct MainScreen_Previews: PreviewProvider {
        static var previews: some View {
            MainScreen()
        }
    }

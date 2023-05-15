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
                            TopSlider()
                            .padding(.horizontal, 16)
                            
                            VStack {
                                Section {
                                    MainPicker()
                                }
                            }
                            .frame(height: 600)
                            .padding(.bottom, 8)
                        }
                        .padding(.bottom, 20)
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

import SwiftUI

struct MainScreen: View {
    
    @StateObject private var vm = MainViewModel()
    
    var body: some View {
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
                            HStack(alignment: .center, spacing: 12) {
                                ForEach(vm.photos.prefix(12), id: \.id) { image in
                                    TopSlider(photo: image)
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
            .onAppear(perform: vm.fetchPhotos)
        }
        
    }
}


struct MainScreen_Previews: PreviewProvider {
    static var previews: some View {
        MainScreen()
    }
}

//
//  MainScreen.swift
//  SwiftUI-API-Call-Decode-JSON
//
//  Created by PSI_ErsanV on 2.02.2023.
//

import SwiftUI

struct TopSlider: View {
    
    @State private var imageData: Data?
    @State var isLoading = true
    let photo: Photos
    
    var body: some View {
        
        VStack {
            if let data = imageData {
                Image(uiImage: UIImage(data: data)!)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 200)
                    .cornerRadius(12)
            } else {
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle())
                    .scaleEffect(2.0)
                    .foregroundColor(.white)
                    .padding(20)
                    .clipShape(Circle())
                    .opacity(isLoading ? 1.0 : 0.0)
                
            }
        }
        .onAppear {
            self.loadImage()
        }
    }
    private func loadImage() {
        guard let url = URL(string: photo.url) else {
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


struct TopSlider_Previews: PreviewProvider {
    static var previews: some View {
        TopSlider(photo: .init(albumId: 0,
                               id: 0,
                               title: "Mikasa",
                               url: "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/ffe099fb-0ab3-4d79-aabc-5b1cbc0eaf7a/ddwmnda-0062c801-37ea-4f60-967c-4702c33e28c1.jpg/v1/fill/w_1280,h_1431,q_75,strp/attack_on_titan___mikasa_ackerman_by_munyi90_ddwmnda-fullview.jpg?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcL2ZmZTA5OWZiLTBhYjMtNGQ3OS1hYWJjLTViMWNiYzBlYWY3YVwvZGR3bW5kYS0wMDYyYzgwMS0zN2VhLTRmNjAtOTY3Yy00NzAyYzMzZTI4YzEuanBnIiwiaGVpZ2h0IjoiPD0xNDMxIiwid2lkdGgiOiI8PTEyODAifV1dLCJhdWQiOlsidXJuOnNlcnZpY2U6aW1hZ2Uud2F0ZXJtYXJrIl0sIndtayI6eyJwYXRoIjoiXC93bVwvZmZlMDk5ZmItMGFiMy00ZDc5LWFhYmMtNWIxY2JjMGVhZjdhXC9tdW55aTkwLTQucG5nIiwib3BhY2l0eSI6OTUsInByb3BvcnRpb25zIjowLjQ1LCJncmF2aXR5IjoiY2VudGVyIn19.jYCjvEe1UPPsQBosSH0dYBJU00VDAXWPfnqRIc3GN28",
                               thumbnailUrl: "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/ffe099fb-0ab3-4d79-aabc-5b1cbc0eaf7a/ddwmnda-0062c801-37ea-4f60-967c-4702c33e28c1.jpg/v1/fill/w_1280,h_1431,q_75,strp/attack_on_titan___mikasa_ackerman_by_munyi90_ddwmnda-fullview.jpg?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcL2ZmZTA5OWZiLTBhYjMtNGQ3OS1hYWJjLTViMWNiYzBlYWY3YVwvZGR3bW5kYS0wMDYyYzgwMS0zN2VhLTRmNjAtOTY3Yy00NzAyYzMzZTI4YzEuanBnIiwiaGVpZ2h0IjoiPD0xNDMxIiwid2lkdGgiOiI8PTEyODAifV1dLCJhdWQiOlsidXJuOnNlcnZpY2U6aW1hZ2Uud2F0ZXJtYXJrIl0sIndtayI6eyJwYXRoIjoiXC93bVwvZmZlMDk5ZmItMGFiMy00ZDc5LWFhYmMtNWIxY2JjMGVhZjdhXC9tdW55aTkwLTQucG5nIiwib3BhY2l0eSI6OTUsInByb3BvcnRpb25zIjowLjQ1LCJncmF2aXR5IjoiY2VudGVyIn19.jYCjvEe1UPPsQBosSH0dYBJU00VDAXWPfnqRIc3GN28"))
    }
}


//HStack(alignment: .center, spacing: 12) {
//    ForEach(images, id: \.self) { image in
//        Image(image)
//            .resizable()
//            .aspectRatio(contentMode: .fit)
//            .frame(width: 200)
//            .cornerRadius(12)
//    }
//}



//ScrollView(.horizontal, showsIndicators: false) {
//    HStack(alignment: .center, spacing: 12) {
//        ForEach(vm.users, id: \.id) { image in
//
//            let str = image.url
//
//            if let data = Data(base64Encoded: str), let uiImage = UIImage(data: data) {
//                Image(uiImage: uiImage)
//                    .resizable()
//                    .aspectRatio(contentMode: .fit)
//                    .frame(width: 200)
//                    .cornerRadius(12)
//
//            } else {
//                let _ = print("FAIL")
//            }
//        }
//    }
//}

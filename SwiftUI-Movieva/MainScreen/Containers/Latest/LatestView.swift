import SwiftUI

struct LatestView: View {
    var body: some View {
        GeometryReader { geometry in
                    ScrollView {
                        VStack(spacing: 20) {
                            ForEach(0..<6) { index in
                                HStack(spacing: 20) {
                                    ForEach(0..<3) { columnIndex in
                                        Image("levi")
                                            .resizable()
                                            .aspectRatio(contentMode: .fill)
                                            .frame(height: 150)
                                            .padding(6)
                                            .background(Color.green)
                                            .cornerRadius(8)
                                    }
                                }
                            }
                        }
                        .padding()
                    }
                    .frame(width: geometry.size.width, height: geometry.size.height, alignment: .center)
                }
            }
        }

struct LatestView_Previews: PreviewProvider {
    static var previews: some View {
        LatestView()
    }
}


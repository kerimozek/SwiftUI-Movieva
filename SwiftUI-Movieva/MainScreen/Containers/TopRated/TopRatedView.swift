//
//  TopRated.swift
//  SwiftUI-Movieva
//
//  Created by PSI_ErsanV on 3.02.2023.
//

import SwiftUI

struct TopRatedView: View {
  
    var body: some View {
        GeometryReader { geometry in
                    ScrollView {
                        VStack(spacing: 20) {
                            ForEach(0..<6) { index in
                                HStack(spacing: 20) {
                                    ForEach(0..<3) { columnIndex in
                                        Image("mikasa")
                                            .resizable()
                                            .aspectRatio(contentMode: .fill)
                                            .frame(height: 150)
                                            .padding(6)
                                            .background(Color.blue)
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

struct TopRated_Previews: PreviewProvider {
    static var previews: some View {
        TopRatedView()
    }
}

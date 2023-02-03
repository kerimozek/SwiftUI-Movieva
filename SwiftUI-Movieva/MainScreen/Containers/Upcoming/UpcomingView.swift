//
//  UpcomingView.swift
//  SwiftUI-Movieva
//
//  Created by PSI_ErsanV on 3.02.2023.
//

import SwiftUI

struct UpcomingView: View {
    var body: some View {
        GeometryReader { geometry in
                    ScrollView {
                        VStack(spacing: 20) {
                            ForEach(0..<6) { index in
                                HStack(spacing: 20) {
                                    ForEach(0..<3) { columnIndex in
                                        Image("ereh")
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

struct UpcomingView_Previews: PreviewProvider {
    static var previews: some View {
        UpcomingView()
    }
}

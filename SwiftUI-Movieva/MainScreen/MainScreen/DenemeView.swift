//
//  DenemeView.swift
//  SwiftUI-Movieva
//
//  Created by PSI_ErsanV on 3.02.2023.
//

import SwiftUI

struct DenemeView: View {
    let colors = [Color.red, Color.green, Color.blue, Color.orange, Color.pink]
        
        @State private var selectedColor = 0

        var body: some View {
            GeometryReader { geometry in
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(alignment: .center) {
                        ForEach(self.colors, id: \.self) { color in
                            Rectangle()
                                .fill(color)
                                .frame(width: geometry.size.width / 1.3, height: geometry.size.height / 4)
                        }
                    }
                    .padding(.horizontal, 12)
                    
                    Picker(selection: self.$selectedColor, label: Text("")) {
                        ForEach(0 ..< self.colors.count) {
                            Text("Color \($0)").tag($0)
                        }
                    }
                    .pickerStyle(WheelPickerStyle())
                }
            }
        }
    }

struct DenemeView_Previews: PreviewProvider {
    static var previews: some View {
        DenemeView()
    }
}

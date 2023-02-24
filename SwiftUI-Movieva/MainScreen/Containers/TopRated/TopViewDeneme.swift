//
//  TopViewDeneme.swift
//  SwiftUI-Movieva
//
//  Created by PSI_ErsanV on 22.02.2023.
//

import SwiftUI

struct TopViewDeneme: View {
    let items = Array(0..<100)
    
    var body: some View {
        ScrollViewReader { proxy in
            VStack {
                Button("Scroll to Top") {
                    proxy.scrollTo(0, anchor: .top)
                }
                Button("Scroll to Bottom") {
                    proxy.scrollTo(items.count - 1, anchor: .bottom)
                }
                
                ScrollView {
                    ForEach(items, id: \.self) { item in
                        Text("Item \(item)")
                            .font(.title)
                            .frame(maxWidth: .infinity)
                            .id(item)
                    }
                }
            }
        }
    }
}

struct TopViewDeneme_Previews: PreviewProvider {
    static var previews: some View {
        TopViewDeneme()
    }
}

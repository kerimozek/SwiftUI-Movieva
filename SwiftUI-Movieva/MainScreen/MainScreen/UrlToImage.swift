//
//  UrlToImage.swift
//  SwiftUI-Movieva
//
//  Created by PSI_ErsanV on 13.02.2023.
//

import SwiftUI

struct UrlToImage: View {
    
    let user: User
    
    var body: some View {
        
        VStack(alignment: .center){
            Text(user.name)
            Text(user.email)
            Text(user.company.name)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
       
    }
}

struct UrlToImage_Previews: PreviewProvider {
    static var previews: some View {
        UrlToImage(user: .init(id: 0, name: "Lollik", email: "lollik@gmail.com", company: .init(name: "Lollik")))
    }
}

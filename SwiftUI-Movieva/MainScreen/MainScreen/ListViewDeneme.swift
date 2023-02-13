//
//  ListViewDeneme.swift
//  SwiftUI-Movieva
//
//  Created by PSI_ErsanV on 13.02.2023.
//

import SwiftUI

struct ListViewDeneme: View {
    
    @StateObject private var vm = DenemeViewModel()
    
    var body: some View {
        
        NavigationView{
            
            ZStack {
                List {
                    ForEach(vm.users, id: \.id) { user in
                        UrlToImage(user: user)
                    }
                }
                .listStyle(.plain)
            .navigationTitle("Users")
            }
            .onAppear(perform: vm.fetchUsers)
        }
    }
}

struct ListViewDeneme_Previews: PreviewProvider {
    static var previews: some View {
        ListViewDeneme()
    }
}

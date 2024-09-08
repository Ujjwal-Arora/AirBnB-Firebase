//
//  ExploreVIew.swift
//  AirBnB
//
//  Created by Ujjwal Arora on 08/09/24.
//

import SwiftUI

struct ExploreVIew: View {
    @StateObject var vm = ExploreViewModel()
    var body: some View {
        VStack{
            Image(systemName: "trophy")
            ForEach(vm.listings) {listing in
                Text(listing.title)
                
            }
        }
    }
}

#Preview {
    ExploreVIew()
}

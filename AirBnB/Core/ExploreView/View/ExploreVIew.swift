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
        ScrollView{
            LazyVStack{
                ForEach(vm.listings) {listing in
                    NavigationLink(value: listing) {
                        ListingRowView(listing: listing)
                    }
                }.navigationDestination(for: ListingsModel.self) { listing in
                    ListingDetailView()
                }
            }
        }
    }
}

#Preview {
    NavigationStack{
        ExploreVIew()
    }
}

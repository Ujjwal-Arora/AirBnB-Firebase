//
//  ListingImageCarouselView.swift
//  AirBnB
//
//  Created by Ujjwal Arora on 08/09/24.
//

import SwiftUI

struct ListingImageCarouselView: View {
    var listing : ListingsModel
    var body: some View {
        VStack(spacing: 8){
            TabView {
                ForEach(listing.imageUrl,id: \.self) { image in
                    Image(image)
                        .resizable()
                }
            }.tabViewStyle(.page)
                .frame(height: 320)
                .clipShape(RoundedRectangle(cornerRadius: 10))
        }
    }
}

#Preview {
    NavigationStack{
        ListingImageCarouselView(listing: DeveloperPreview.shared.exampleListings[0])
    }
}

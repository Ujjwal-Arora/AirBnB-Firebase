//
//  ListingRowView.swift
//  AirBnB
//
//  Created by Ujjwal Arora on 08/09/24.
//

import SwiftUI

struct ListingRowView: View {
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
            
            HStack(alignment: .top){
                VStack(alignment : .leading){
                    Text("\(listing.city), \(listing.state)")
                        .bold()
                    Text("Rs.\(listing.pricePerNight) per night")
                }
                Spacer()
                    HStack(spacing : 2){
                        Image(systemName: "star.fill")
                        Text(listing.rating.formatted())
                }
                
            }.font(.footnote)

        }.padding(.horizontal)
    }
}

#Preview {
    NavigationStack{
        ListingRowView(listing: DeveloperPreview.shared.exampleListings[0])
    }
}

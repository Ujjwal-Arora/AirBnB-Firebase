//
//  ExploreViewModel.swift
//  AirBnB
//
//  Created by Ujjwal Arora on 08/09/24.
//

import Foundation

class ExploreViewModel : ObservableObject {
    @Published var listings = [ListingsModel]()
     private let service = ExploreService()
    
    init(){
        Task{
            await self.fetchListings()
        }
    }
    
    func fetchListings() async {
        do {
            self.listings = try await service.fetchListings()
        }catch {
            print("DEBUG : Failed to fetch listings : \(error.localizedDescription)")
        }
    }
}

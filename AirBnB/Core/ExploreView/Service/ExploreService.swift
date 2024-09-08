//
//  ExploreService.swift
//  AirBnB
//
//  Created by Ujjwal Arora on 08/09/24.
//

import Foundation

class ExploreService {
    func fetchListings() async throws -> [ListingsModel]{
        return DeveloperPreview.shared.exampleListings
    }
}

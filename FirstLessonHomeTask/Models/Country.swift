//
//  Country.swift
//  FirstLessonHomeTask
//
//  Created by VLADIMIR LEVTSOV on 06.12.2020.
//

import SwiftUI
import CoreLocation

struct Country: Decodable {
    let name: String
    let region: String
    let capital: String
    let population: Int
    let area: Double?
    let latlng: [Double]
    let alpha2Code: String
}

extension Country {
    
    var locationCoordinate: CLLocationCoordinate2D? {
        guard let lat = latlng.first, let lon = latlng.last else { return nil }
        return CLLocationCoordinate2D(
            latitude: lat,
            longitude: lon)
    }
    
    var image: Image {
        ImageStoreManager.shared.image(name: alpha2Code.lowercased())
    }
    
    var id: String {
        return alpha2Code
    }
}

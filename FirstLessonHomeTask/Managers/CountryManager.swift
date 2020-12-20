//
//  CountryManager.swift
//  FirstLessonHomeTask
//
//  Created by VLADIMIR LEVTSOV on 06.12.2020.
//

import Foundation

final class CountryManager {
    
    static func fetchCountries() -> [Country] {
        guard let file = Bundle.main.url(forResource: "countries.json", withExtension: nil),
              let data = try? Data(contentsOf: file),
              let countries = try? JSONDecoder().decode([Country].self, from: data)
            else {
                return []
        }
        return countries
    }
    
    static func randomCountry() -> Country? {
        return fetchCountries().randomElement()
    }
    
    static func fetchCountry(by id: String) -> Country? {
        return fetchCountries().first(where: {$0.id == id})
    }
    
}

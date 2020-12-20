//
//  CountryDetails.swift
//  FirstLessonHomeTask
//
//  Created by VLADIMIR LEVTSOV on 06.12.2020.
//

import SwiftUI

class CountryDetailsViewModel: ObservableObject {
    let id: String?
    
    @Published private var country: Country?
    
    init(id: String?) {
        self.id = id
    }
    
    var countryName: String {
        return country?.name ?? ""
    }
    
    var flag: Image? {
        return country?.image
    }
    
    var population: String {
        return "\(country?.population ?? 0)"
    }
    
    var capital: String {
        return country?.capital ?? "-"
    }
    
    func fetchCountry() {
        if let id = id {
            self.country = CountryManager.fetchCountry(by: id)
        } else {
            self.country = CountryManager.randomCountry()
        }
    }
}

struct CountryDetails: View {
    @ObservedObject var viewModel: CountryDetailsViewModel
    
    var body: some View {
        VStack(alignment: .center, spacing: 20) {
            viewModel.flag
                .shadow(radius: 10)
            HStack {
                Text("Capital")
                    .font(.subheadline)
                Spacer()
                Text(viewModel.capital)
                    .font(.subheadline)
            }
            HStack {
                Text("Population")
                    .font(.subheadline)
                Spacer()
                Text(viewModel.population)
                    .font(.subheadline)
            }
        }
        .padding()
        .navigationBarTitle(Text(viewModel.countryName), displayMode: .inline)
        .onAppear {
            self.viewModel.fetchCountry()
        }
    }
    
    
}

struct CountryDetails_Previews: PreviewProvider {
    static var previews: some View {
        CountryDetails(viewModel: CountryDetailsViewModel(id: nil))
    }
}

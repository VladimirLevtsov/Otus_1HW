//
//  CountryList.swift
//  FirstLessonHomeTask
//
//  Created by VLADIMIR LEVTSOV on 06.12.2020.
//

import SwiftUI
import Combine

class CountryListViewModel: ObservableObject {
    private(set) var countryRowViewModels: [CountryRowViewModel] = {
        let countries = CountryManager.fetchCountries()
        return countries.map({ CountryRowViewModel(
                                id: $0.alpha2Code,
                                flag: $0.image,
                                countryName: $0.name)
                            })
        
    }()
}

struct CountryList: View {
    @StateObject var vm = CountryListViewModel()
    @Binding var shouldPushRandomCountry: Bool
    
    var body: some View {
        NavigationView {
            List(vm.countryRowViewModels) { countryVM in
                NavigationLink(destination: CountryDetails(viewModel: CountryDetailsViewModel(id: countryVM.id))) {
                    CoutryRow(viewModel: countryVM)
                }
            }
            .overlay(
                NavigationLink(destination: CountryDetails(viewModel: CountryDetailsViewModel(id: nil)), isActive: $shouldPushRandomCountry) {
                    EmptyView()
                }
                .hidden()
                
            )
            .navigationBarTitle("Countries")
        }
        .phoneOnlyStackNavigationView()
    }
    
}

struct CountryList_Previews: PreviewProvider {
    static var previews: some View {
        CountryList(shouldPushRandomCountry: .constant(false))
    }
}

//
//  CoutryRow.swift
//  FirstLessonHomeTask
//
//  Created by VLADIMIR LEVTSOV on 06.12.2020.
//

import SwiftUI

struct CountryRowViewModel: Identifiable {
    var id: String
    let flag: Image
    let countryName: String
}

struct CoutryRow: View {
    let viewModel: CountryRowViewModel
    
    var body: some View {
        HStack {
            viewModel.flag
                .resizable()
                .frame(width: 50, height: 50)
            Text(viewModel.countryName)
            Spacer()
        }
    }
}

struct CoutryRow_Previews: PreviewProvider {
    static var previews: some View {
        CoutryRow(viewModel: CountryRowViewModel(id: "0", flag: ImageStoreManager.shared.image(name: "af"), countryName: "Belgium"))
            .previewLayout(.fixed(width: 200, height: 50))
    }
}

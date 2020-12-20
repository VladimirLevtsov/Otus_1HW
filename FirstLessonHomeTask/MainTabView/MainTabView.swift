//
//  MainTabView.swift
//  FirstLessonHomeTask
//
//  Created by Vladimir on 20.12.2020.
//

import SwiftUI

struct MainTabView: View {
    
    @EnvironmentObject var router: TabRouter
    
    
    var body: some View {
        TabView(selection: $router.tabSelection) {
            FirstTabView()
                .tabItem {
                    Image(systemName: "arrowshape.bounce.forward.fill")
                    Text("1")
                }
                .tag(1)
            CountryList(shouldPushRandomCountry: $router.shouldRandomize)
                .tabItem {
                    Image(systemName: "map")
                    Text("Countries")
                }
                .tag(2)
                .onDisappear {
                    router.shouldRandomize = false
                }
            ThirdTabView()
                .tabItem {
                    Image(systemName: "cube")
                    Text("3")
                }
                .tag(3)
        }
    }
}

struct FirstTabView: View {
    @EnvironmentObject var router: TabRouter
    
    var body: some View {
        Button("Random Country") {
            self.router.tabSelection = 2
            self.router.shouldRandomize = true
        }
        
    }
}

struct ThirdTabView: View {
    @State var showModal: Bool = false
    
    var body: some View {
        Button(action: {
            showModal = true
        }) {
            Text("Present Random Country")
        }.sheet(isPresented: $showModal) {
            NavigationView {
                CountryDetails(viewModel: CountryDetailsViewModel(id: nil))
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        RootView()
    }
}


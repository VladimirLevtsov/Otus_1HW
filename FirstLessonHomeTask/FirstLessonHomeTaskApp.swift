//
//  FirstLessonHomeTaskApp.swift
//  FirstLessonHomeTask
//
//  Created by VLADIMIR LEVTSOV on 03.12.2020.
//

import SwiftUI

@main
struct FirstLessonHomeTaskApp: App {
    var body: some Scene {
        WindowGroup {
            RootView()
                .environmentObject(TabRouter())
        }
    }
}

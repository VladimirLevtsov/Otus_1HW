//
//  TabRouter.swift
//  FirstLessonHomeTask
//
//  Created by VLADIMIR LEVTSOV on 09.12.2020.
//

import Combine

class TabRouter: ObservableObject {
    @Published var tabSelection: Int = 0
    @Published var shouldRandomize = false
}

//
//  MainTabBarViewModel.swift
//  Shop
//
//  Created by Денис Александров on 26.10.2022.
//

import Foundation
import FirebaseAuth

class MainTabBarViewModel: ObservableObject {
    
    @Published var user: User
    
    init(user: User) {
        self.user = user
    }
    
}

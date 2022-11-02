//
//  ShopApp.swift
//  Shop
//
//  Created by Денис Александров on 20.10.2022.
//

import SwiftUI
import Firebase
import FirebaseAuth

let screen = UIScreen.main.bounds

@main
struct ShopApp: App {

    @UIApplicationDelegateAdaptor private var appDelegate: Appdelegate
    
    var body: some Scene {
        WindowGroup {
            // открытие пользователя если он зашел
            
            if let user = AuthService.shared.currentUser {
                let viewModel = MainTabBarViewModel(user: user)
                MainTabBar(viewModel: viewModel)
            } else {
                AuthtView()
            }
            
        }
    }
    
    class Appdelegate: NSObject, UIApplicationDelegate {
        
        
        func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
            
            FirebaseApp.configure()
            print("ОК")
            
            return true
            
        }
        
    }
}







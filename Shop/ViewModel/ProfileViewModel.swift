//
//  ProfileViewModel.swift
//  Shop
//
//  Created by Денис Александров on 27.10.2022.
//

import Foundation

class ProfileViewModel: ObservableObject {
    
    @Published var profile: MWUser
    @Published var orders: [Order] = [Order]()
    
    init(profile: MWUser) {
        self.profile = profile
    }
    func getOrders() {
        DatabaseService.shared.getOrders(by: AuthService.shared.currentUser!.accessibilityHint) { result in
            switch result {
                
            case .success(let orders):
                self.orders = orders
                
                for (index, order) in self.orders.enumerated() {
                    DatabaseService.shared.getOrders(by: order.id) { result in
                        switch result {
                        case .success(let positions):
//                            self.orders[index].positions = positions
                            print(self.orders[index].cost)
                        case .failure(let error):
                            print(error.localizedDescription)
                        }
                    }
                }
                
                print("Всего заказов: \(orders.count)")
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }


    func setProfile() {
        
        DatabaseService.shared.setProfile(user: self.profile) { result in
            switch result {
                
            case .success(let user):
                print(user.name)
            case .failure(let error):
                print("Ошибка отправки данных\(error.localizedDescription)")
            }
        }
        
    }
    
    func getprofile() {
        DatabaseService.shared.getProfile { result in
            switch result {
            case .success(let user):
                self.profile = user
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}

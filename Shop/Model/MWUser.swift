//
//  MWUser.swift
//  Shop
//
//  Created by Денис Александров on 26.10.2022.
//

import Foundation

struct MWUser: Identifiable {
    
    var id: String
    var name: String
    var phone: Int
    var address: String
    
    var representation: [String: Any] {
        
        var repres = [String: Any]()
        repres["id"] = self.id
        repres["name"] = self.name
        repres["phone"] = self.phone
        repres["address"] = self.address
        
        return repres
    }

    
}




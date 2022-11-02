//
//  ProduktDetailViewModel.swift
//  Shop
//
//  Created by Денис Александров on 24.10.2022.
//

import Foundation

// всегда так
class ProductDetailViewModel: ObservableObject {
    
    @Published var product: Product
    @Published var sizes = ["Маленький", "Средний", "Большой"]
    @Published var count = 0
    
    init(product: Product) {
        self.product = product
    }
    
    func getPrice(size: String) -> Int {
        switch size {
        case "Маленький": return product.price
        case "Средний": return Int(Double(product.price) * 1.25)
        case "Большой": return Int(Double(product.price) * 1.5)
        default: return 0
            
        }
        
    }
    
}














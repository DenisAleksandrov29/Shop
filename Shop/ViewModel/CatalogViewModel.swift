//
//  CatalogViewModel.swift
//  Shop
//
//  Created by Денис Александров on 21.10.2022.
//

import Foundation
class CatalogViewModel: ObservableObject {
    
    static let shared = CatalogViewModel()
    
    var popularProducts = [
        
        Product(id: "1",
                title: "Маргарита Гурмэ",
                imageUrl: "Not found",
                price: 450,
                description: "самая простая пицца"),
        Product(id: "2",
                title: "Маргарита",
                imageUrl: "Not found",
                price: 350,
                description: "самая простая пицца"),
        Product(id: "3",
                title: "Пеперони",
                imageUrl: "Not found",
                price: 550,
                description: "самая простая пицца"),
        Product(id: "4",
                title: "Гавайская",
                imageUrl: "Not found",
                price: 250,
                description: "самая простая пицца"),
        Product(id: "5",
                title: "Диабло",
                imageUrl: "Not found",
                price: 650,
                description: "самая простая пицца")
    ]
    
    var pizza = [
        
        Product(id: "1",
                title: "Маргарита Гурмэ",
                imageUrl: "Not found",
                price: 450,
                description: "самая простая пицца"),
        Product(id: "2",
                title: "Маргарита",
                imageUrl: "Not found",
                price: 350,
                description: "самая простая пицца"),
        Product(id: "3",
                title: "Пеперони",
                imageUrl: "Not found",
                price: 550,
                description: "самая простая пицца"),
        Product(id: "4",
                title: "Гавайская",
                imageUrl: "Not found",
                price: 250,
                description: "самая простая пицца"),
        Product(id: "5",
                title: "Диабло",
                imageUrl: "Not found",
                price: 650,
                description: "самая простая пицца")
    ]
    
}


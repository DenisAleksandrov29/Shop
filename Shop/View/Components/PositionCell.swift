//
//  PositionCell.swift
//  Shop
//
//  Created by Денис Александров on 24.10.2022.
//

import SwiftUI

struct PositionCell: View {
    
    let position: Position
    
    var body: some View {
        HStack {
            Text(position.product.title)
                .fontWeight(.bold)
            Spacer()
            Text("\(position.count) шт.")
            Text("\(position.count) ₽")
                .frame(width: 78, alignment: .trailing)
        }.padding(.horizontal)
    }
}
// это мы пилим корзину

struct PositionCell_Previews: PreviewProvider {
    static var previews: some View {
        PositionCell(
        
            position: Position(id: UUID().uuidString, product: Product(id: UUID().uuidString,
                                                                       title: "Маргарита гурмэ",
                                                                       imageUrl: "ph",
                                                                       price: 350,
                                                                       description: "описание"),
                               count: 3)
        )
    }
}

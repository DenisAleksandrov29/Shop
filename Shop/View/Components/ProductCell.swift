//
//  ProductCell.swift
//  Shop
//
//  Created by Денис Александров on 21.10.2022.
//

import SwiftUI

struct ProductCell: View {
    
    var product: Product
    
    var body: some View {
        
        VStack(spacing: 2) {
            Image("ph")
                .resizable()// изменение размеров по экрану
                .aspectRatio(contentMode: .fill)
                .frame(maxWidth: screen.width * 0.45)
                .clipped() // обрезать по краям
                .cornerRadius(16)
            
            HStack{
                Text(product.title)
                    .font(.custom("AvenirNext-regular", size: 12))
                Spacer()// раскинуть текст по краям
                Text("\(product.price) ₽") // ₽ option + р(русский) рубль
                    .font(.custom("AvenirNext-bold", size: 12))
            }
            .padding(.horizontal, 5)
            .padding(.bottom,4)
        }.frame(width: screen.width * 0.45,height: screen.width * 0.55)
            .background(.white)
            .cornerRadius(16)
            .shadow(radius: 4)
            
            
        
    }
}

struct ProductCell_Previews: PreviewProvider {
    static var previews: some View {
        ProductCell(product: Product(id: "1",
                                     title: "Маргарита Гурмэ",
                                     imageUrl: "Not found",
                                     price: 450,
                                     description: "самая простая пицца"))
    }
}




//
//  ProductDetailView.swift
//  Shop
//
//  Created by Денис Александров on 21.10.2022.
//

import SwiftUI

struct ProductDetailView: View {
    
    var viewModel: ProductDetailViewModel
    @State var size = "Маленький"
    @State var count = 1
    
    @Environment(\.presentationMode) var presentationMode

    
    var body: some View {
        
        
        VStack {
            VStack(alignment: .leading) {
                Image("ph")
                    .resizable()
                    .frame(maxWidth: .infinity,maxHeight: 260);
                
                HStack {
                    Text("\(viewModel.product.title)")
                        .font(.title3.bold())
                    Spacer()
                    Text("\(viewModel.getPrice(size: self.size)) ₽")
                        .font(.title3)
                }.padding(.horizontal)
                
                Text("\(viewModel.product.description)")
                    .padding(.horizontal)
                    .padding(.vertical, 4)
                
                HStack {
                    Stepper("Количество", value: $count, in: 1...10)
                    
                    Text("\(self.count)")
                
                        .padding(.leading, 32)
                    
                }.padding(.horizontal)
                
                Picker("Размер", selection: $size) {
                    ForEach(viewModel.sizes, id: \.self) { item in
                        Text(item)
                    }
                }.pickerStyle(.segmented)
                    .padding()
                
            }.ignoresSafeArea()
            
            Button {
                var position = Position(id: UUID().uuidString,
                                        product: viewModel.product,
                                        count: self.count)
                position.product.price = viewModel.getPrice(size: size)
                
                CartViewModel.shared.addPosition(position)

                presentationMode.wrappedValue.dismiss()
                
            } label: {
                Text("В корзину")
                    .padding()
                    .padding(.horizontal,70)
                    .foregroundColor(Color("darkBrown"))
                    .font(.title3.bold())
                    .background(LinearGradient(colors: [Color("yellow"), Color("orange")],
                                               startPoint: .leading,
                                               endPoint: .trailing))
                    .cornerRadius(30)
            }

            Spacer()
        }
        
    }
}



struct ProductDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ProductDetailView(viewModel: ProductDetailViewModel(product: Product(id: "1",
                                                                      title: "Маргарита Гурмэ",
                                                                      imageUrl: "Not found",
                                                                      price: 450,
                                                                      description: "самая простая пицца")))
    }
}










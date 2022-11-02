//
//  Catalog.swift
//  Shop
//
//  Created by Денис Александров on 21.10.2022.
//

import SwiftUI

struct CatalogView: View {
    
    //GridItem(.adaptive min max
    let layout = [GridItem(.adaptive(minimum: screen.width / 2.4))]
    
    var body: some View {

        ScrollView(.vertical, showsIndicators: false) {
            Section("Рекомендуемое") {
                ScrollView(.horizontal, showsIndicators: false) {
                    LazyHGrid(rows: layout, spacing: 14) {
                        ForEach(CatalogViewModel.shared.popularProducts, id: \.id) { item in
                            NavigationLink {
                                
                                let viewModel = ProductDetailViewModel(product: item)
                                
                                ProductDetailView(viewModel: viewModel)
                            } label: {
                                ProductCell(product: item)
                                    .foregroundColor(.black)
                            }
                        }
                    }.padding()
                }

            }
            
            Section("Пицца") {

                ScrollView(.vertical, showsIndicators: false) {


                    // ленивая сетка layout
                    LazyVGrid(columns: layout) {
                        ForEach(CatalogViewModel.shared.popularProducts, id: \.id) { item in

                            NavigationLink {
                                
                                let viewModel = ProductDetailViewModel(product: item)
                                ProductDetailView(viewModel: viewModel)
                            } label: {
                                ProductCell(product: item)
                                    .foregroundColor(.black)
                            }
                        }
                    }.padding()
                }

            }
            
        }.navigationBarTitle(Text("Каталог"))
        
    }
}

struct Catalog_Previews: PreviewProvider {
    static var previews: some View {
        CatalogView()
    }
}



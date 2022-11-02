//
//  ProfileView.swift
//  Shop
//
//  Created by Денис Александров on 21.10.2022.
//

import SwiftUI

struct ProfileView: View {

    @State var isAvaAlertPressented = false
    @State var isQuitAlertPressented = false
    @State var isAuthViewPresented = false
    @StateObject var viewModel: ProfileViewModel
    
    var body: some View {
        
        VStack(alignment: .center, spacing: 20) {
            HStack(spacing: 16){
                Image("user")
                    .resizable()
                    .frame(width: 80, height: 80)
                    .padding(8)
                    .background(Color("lightGray"))
                    .clipShape(Circle())
                    .onTapGesture {
                        isAvaAlertPressented.toggle()
                    }
                    .confirmationDialog("Откуда взять фотку", isPresented: $isAvaAlertPressented) {
                        Button {
                            print("Library")
                        } label: {
                            Text("Из галереи")
                        }
                        
                        Button {
                            print("Camera")
                        } label: {
                            Text("С камеры")
                        }
                    }
                    
                
                VStack(alignment: .leading, spacing: 12) {
                    TextField("Имя",text: $viewModel.profile.name)
                        .font(.body.bold())
                    
                    HStack {
                        Text("+7")
                        TextField("Телефон",
                                  value: $viewModel.profile.phone,
                                  format: IntegerFormatStyle.number)
                    }
                }
                
            }.padding()
            
            VStack(alignment: .leading, spacing: 8){
                Text("Адрес доставки")
                    .bold()
                TextField("Ваш адрес", text: $viewModel.profile.address)
            }.padding(.horizontal)
            List {
                if viewModel.orders.count == 0 {
                    Text("Ваши заказы будут тут!")
                } else {
                    ForEach(viewModel.orders, id: \.id) { order in
                        OrderCell(order: order)
                    }
                }
                
            }.listStyle(.plain)
            
            Button {
                isQuitAlertPressented.toggle()
            } label: {
                Text("Выйти")
                    .padding()
                    .padding(.horizontal, 30)
                    .background(Color.red)
                    .foregroundColor(.white)
                    .cornerRadius(20)
                
            }.padding()
                .confirmationDialog("Действительно хотите выйти", isPresented: $isQuitAlertPressented) {
                    Button {
                        isAuthViewPresented.toggle()
                    } label: {
                        Text("Да")
                    }

                }

                .fullScreenCover(isPresented: $isAuthViewPresented, onDismiss: nil) {
                    AuthtView()
                }
        }
            .onSubmit {
                viewModel.setProfile()
            }
            .onAppear {
                self.viewModel.getprofile()
                self.viewModel.getprofile()
            }
            
        }
        
    }

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(viewModel: ProfileViewModel(profile:MWUser(id: "",
                                                               name: "Вася Трожков",
                                                               phone: 8498493423,
                                                               address: "Адрес")))
    }
}




                    













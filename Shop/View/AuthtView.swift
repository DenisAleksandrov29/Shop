//
//  ContentView.swift
//  Shop
//
//  Created by Денис Александров on 20.10.2022.
//

import SwiftUI



struct AuthtView: View {
    //
    @State private var isAuth = true
    @State private var email = ""
    @State private var password = ""
    @State private var confirmPassword = ""
    @State private var isTabViewShow = false
    @State private var isShowAlert = false
    @State private var alertMessage = ""
    
    var body: some View {
        VStack(spacing: 20) {
            Text(isAuth ? "Авторизация" : "Регестрация")
                .padding(isAuth ? 16 : 24)
                .padding(.horizontal, 30)
                .font(.title2.bold())
                .background(Color("whiteAlpha"))
                .cornerRadius(isAuth ? 30 : 60)
            
            VStack {
                TextField("Введите Email", text: $email)
                    .padding()
                    .background(Color("whiteAlpha"))
                    .cornerRadius(12)
                    .padding(8)
                    .padding(.horizontal, 12)
                SecureField("Введите пароль", text: $password)
                    .padding()
                    .background(Color("whiteAlpha"))
                    .cornerRadius(12)
                    .padding(8)
                    .padding(.horizontal, 12)
                
                if !isAuth {
                    SecureField("Повторите пароль", text: $confirmPassword)
                        .padding()
                        .background(Color("whiteAlpha"))
                        .cornerRadius(12)
                        .padding(8)
                        .padding(.horizontal, 12)
                    
                }
                
                Button {
                    if isAuth {
                        print("Авторизация пользователя через Firebace")
                        
                        // авторизация
                        AuthService.shared.signIn(email: self.email,
                                                  password: self.password) { result in
                            switch result {
                                
                            case .success(_):
                                isTabViewShow.toggle()
                            case .failure(let error):
                                alertMessage = "Ошибка авторизации:\(error.localizedDescription)"
                                isShowAlert.toggle()
                            }
                        }
                        isTabViewShow.toggle()
                    } else {
                        print("Регестрация пользователя")
                        guard password == confirmPassword else {
                            self.alertMessage = "Пароли не совпадают"
                            self.isShowAlert.toggle()
                            return
                        }
                        
                        AuthService.shared.signUp(email: email,
                                                  password: self.password) { result in
                            switch result {
                            case .success(let user):
                                
                                alertMessage = "Вы зарегестроровались с email \(user.email!)"
                                self.isShowAlert.toggle()
                                self.email = ""
                                self.password = ""
                                self.confirmPassword = ""
                                self.isAuth.toggle()
                                
                            case .failure(let error):
                                alertMessage = "Ошибка регестрации \(error.localizedDescription)!"
                                self.isShowAlert.toggle()
                                
                                
                            }
                        }
                    }
                    
                } label: {
                    Text(isAuth ? "Войти" : "Создать аккаунт")
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(LinearGradient(colors: [Color("yellow"),Color ("orange")],
                                                   startPoint: .leading, endPoint: .trailing))
                        .cornerRadius(12)
                        .padding(8)
                        .padding(.horizontal, 12)
                        .font(.title3.bold())
                        .foregroundColor(.black)
                }
                
                Button {
                    isAuth.toggle()
                } label: {
                    Text(isAuth ? "Еще не снами?" : "Уже есть аккаунт")
                        .padding(.horizontal)
                        .frame(maxWidth: .infinity)
                        .cornerRadius(12)
                        .padding(8)
                        .padding(.horizontal, 12)
                        .font(.title3.bold()) // шрифт
                        .foregroundColor(Color("darkBrown"))
                }
                
            }
            .padding()
            .padding(.top, 17)
            .background(Color("whiteAlpha"))
            .cornerRadius(24)
            .padding(isAuth ? 30 : 12)
            .alert(alertMessage, isPresented: $isShowAlert) {
                Button { } label: {
                    Text("Ок")
                }

            }
  
        }.frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Image("bg")
                            .ignoresSafeArea()
                            .blur(radius: isAuth ? 0 : 3)
            )
            .animation(Animation.easeIn(duration: 0.3), value: isAuth)
            .fullScreenCover(isPresented: $isTabViewShow) {
                let mainTabBarViewModel = MainTabBarViewModel(user: AuthService.shared.currentUser!)
                MainTabBar(viewModel: mainTabBarViewModel)
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        AuthtView()
    }
}

















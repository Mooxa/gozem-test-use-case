//
//  LoginView.swift
//  Location
//
//  Created by macbook on 26/07/2022.
//

import SwiftUI
let lightGreyColor = Color(red: 239.0/255.0, green: 243.0/255.0, blue: 244.0/255.0, opacity: 1.0)

struct LoginView: View {
    @State var username: String = ""
    @State var password: String = ""
    @State var selection: Int? = nil
    
    private var viewModel = LoginViewModel()
    
    var body: some View {
        NavigationView {
            ZStack {
                Image("destination")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(minWidth: 0, maxWidth: .infinity,maxHeight: .infinity, alignment: .bottom)
                    .edgesIgnoringSafeArea(.all)
                
                VStack {
                    Text("Welcome!")
                        .font(.largeTitle)
                        .fontWeight(.semibold)
                        .padding(.bottom, 20)
                    Image("connected_world")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 150, height: 150)
                        .clipped()
                        .cornerRadius(150)
                        .padding(.bottom, 45)
                    TextField("email", text: $username)
                        .padding()
                        .background(lightGreyColor)
                        .cornerRadius(5.0)
                        .padding(.bottom, 10)
                    
                    
                    SecureField("Password", text: $password)
                        .padding()
                        .background(lightGreyColor)
                        .cornerRadius(5.0)
                        .padding(.bottom, 10)
                    
                    Text(" Un mot de passe doit contenir au minimum 8 caractères, à savoir : au moins une lettre minuscule et une lettre majuscule, un caractère spécial et un chiffre.")
                        .font(.footnote).foregroundColor(.red)
                        .multilineTextAlignment(.center)
                        .padding(3)
                    
                    NavigationLink(destination: HomeView(), tag: 1, selection: $selection) {
                        Button(action: {
                            // Show error message here
                            if let errorMessage = viewModel.loginSubmit(email: username, password: password){
                                print(errorMessage)
                                return
                            }
                            self.selection = 1
                        }, label: {
                            Text("Login")
                                .frame(height: 45).frame(maxWidth: .infinity)
                                .background(.blue)
                                .foregroundColor(.white)
                                .cornerRadius(10)
                                .font(.headline)
                                .padding()
                        })
                    }
                    if password.isEmpty || username.isEmpty {
                        Text("Email or Password  is Not Valid")
                            .font(.footnote).foregroundColor(.red).hidden()
                    }   else if (viewModel.loginSubmit(email: username, password: password) != nil) {
                        Text(" Un mot de passe doit contenir au minimum 8 caractères, à savoir : au moins une lettre minuscule et une lettre majuscule, un caractère spécial et un chiffre.")
                            .font(.footnote).foregroundColor(.red)
                            .padding(3)
                    }
                    Spacer()
                    NavigationLink(destination: SignupView(), tag: 2, selection: $selection) {
                    Text("Vous n'avez pas de compte? \n S'inscrire")
                        .font(.subheadline).foregroundColor(.blue)
                        .padding(3)
                        .multilineTextAlignment(.center)
                        .onTapGesture {
                            self.selection = 2
                            //  HomeView()
                            
                        }
                    }
                                    
                }
                .padding()
                .frame(minWidth: 0, maxWidth: .infinity,maxHeight: .infinity, alignment: .top)
            }
        }
        
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}

//
//  SignupView.swift
//  Location
//
//  Created by macbook on 29/07/2022.
//

import SwiftUI

struct SignupView: View {
    @State var username: String = ""
    @State var password: String = ""
    @State var email: String = ""
    @State var address: String = ""
    @State var selection: Int? = nil
    var body: some View {
     
        NavigationView {
            ZStack {
                Image("destination")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(minWidth: 0, maxWidth: .infinity,maxHeight: .infinity, alignment: .bottom)
                    .edgesIgnoringSafeArea(.all)
                
                VStack {
                    Text("Signup!")
                        .font(.title)
                        .fontWeight(.semibold)
                        .padding(.bottom, 20)
                    Image("connected_world")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 150, height: 150)
                        .clipped()
                        .cornerRadius(150)
                        .padding(.bottom, 45)
                    TextField("Full Name", text: $username)
                        .padding()
                        .background(lightGreyColor)
                        .cornerRadius(5.0)
                        .padding(.bottom, 10)
                    TextField("email", text: $email)
                        .padding()
                        .background(lightGreyColor)
                        .cornerRadius(5.0)
                        .padding(.bottom, 10)
                    
                    TextField("Address", text: $address)
                        .padding()
                        .background(lightGreyColor)
                        .cornerRadius(5.0)
                        .padding(.bottom, 10)
                    
                    SecureField("Password", text: $password)
                        .padding()
                        .background(lightGreyColor)
                        .cornerRadius(5.0)
                        .padding(.bottom, 10)
                    
                    
                    Text("SIGNUP")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(width: 220, height: 60)
                        .background(Color.blue)
                        .cornerRadius(15.0)
                        .onTapGesture {
                            
                            //  HomeView()
                            
                        }
                    Spacer()
                    NavigationLink(destination: SignupView(), tag: 2, selection: $selection) {
                        Text("Vous n'avez pas de compte? \n S'inscrire")
                            .font(.subheadline).foregroundColor(.blue)
                            .padding(3)
                            .multilineTextAlignment(.center)
                            .onTapGesture {
                                self.selection = 2
                                
                            }
                    }
                    
                    
                }
                .padding()
                .frame(minWidth: 0, maxWidth: .infinity,maxHeight: .infinity, alignment: .top)
            }
        }
    }
}

struct SignupView_Previews: PreviewProvider {
    static var previews: some View {
        SignupView()
    }
}

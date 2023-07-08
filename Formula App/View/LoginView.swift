//
//  LoginView.swift
//  Formula App
//
//  Created by Riccardo Pischtschan on 07.07.23.
//

import SwiftUI
import Firebase

struct LoginView: View {
    
    @State private var email = ""
    @State private var password = ""
   
    @Binding var currentShowingView : String
    @EnvironmentObject var authService: FirebaseAuthService
   
    
    var body: some View{
        ZStack{
            Color.black
            
            RoundedRectangle(cornerRadius: 30, style: .continuous)
                .foregroundStyle(.linearGradient(colors: [.pink, .red], startPoint: .topLeading, endPoint: .bottomTrailing))
                .frame(width:1000, height: 400)
                .rotationEffect(.degrees(135))
                .offset(y: -350)
            
            VStack(spacing: 20) {
                Text("Welcome")
                    .foregroundColor(.white)
                    .font(.system(size: 40,weight: .bold,design: .rounded))
                    .offset(x: -100, y: -100)
                
                Text("to")
                    .foregroundColor(.white)
                    .font(.system(size: 40,weight: .bold,design: .rounded))
                    .offset( y: -100)
                
                Text("Formel 1")
                    .foregroundColor(.white)
                    .font(.system(size: 40,weight: .bold,design: .rounded))
                    .offset(x: +100, y: -100)
                
                HStack{
                    Image(systemName: "mail")
                        .foregroundColor(.white)
                    TextField("", text: $email, prompt: Text("Email").foregroundColor(.white))
                        .foregroundColor(.white)
                    
                    
                    if(email.count != 0) {
                        Image(systemName: email.isValidEmail() ? "checkmark" : "xmark")
                            .fontWeight(.bold)
                            .foregroundColor(email.isValidEmail() ? .green : .red)
                    }
                    
                }
                .foregroundColor(.white)
                .padding()
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(lineWidth: 2)
                        .foregroundColor(.white)
                )
                .frame(width: 350)
                .padding()
                .offset(y: 30)
                
                
                HStack{
                    Image(systemName: "lock")
                        .foregroundColor(.white)
                    SecureField("", text: $password, prompt: Text("Password").foregroundColor(.white))
                        .foregroundColor(.white)
                    Spacer()
                    
                    if(password.count != 0) {
                        Image(systemName: isValidPassword(password) ? "checkmark" : "xmark")
                            .fontWeight(.bold)
                            .foregroundColor(isValidPassword(password) ? .green : .red)
                    }
                }
                .padding()
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(lineWidth: 2)
                        .foregroundColor(.white)
                )
                .frame(width: 350)
                .padding()
                
                Button(action: {
                    withAnimation{
                        self.currentShowingView = "signup"
                    }
                }) {
                    Text("Don´t have an account?")
                        .foregroundColor(.white.opacity(0.7))
                }
                
                
                Button{
                    
                        authService.login(email: email, password: password)
                      
                    
                } label: {
                    Text("Login")
                        .bold()
                        .frame(width: 200,height: 40)
                        .background(
                            RoundedRectangle(cornerRadius: 10, style: .continuous)
                                .fill(.linearGradient(colors: [.green,.blue], startPoint: .top, endPoint: .bottomTrailing ))
                        )
                        .foregroundColor(.white)
                }
                .padding(.top)
                .offset(y: 100)
                
               
                
                
            }
            .frame(width: 350)
            
            
        }
        .ignoresSafeArea()
    }
    
    
   
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView(currentShowingView: .constant(""))
    }
}


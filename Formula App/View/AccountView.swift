//
//  AccountView.swift
//  Formula App
//
//  Created by Riccardo Pischtschan on 05.07.23.
//

import SwiftUI
import FirebaseAuth

struct AccountView: View {
    
    @EnvironmentObject var firebaseAuth: FirebaseAuthService
    @EnvironmentObject var dataManager : DataManager
    @State private var selectedMode = 0
    private let mode = ["F1","Light","Dark","Red Bull","Mercedes","Aston Martin","Ferrari","McLaren","Alpine","Williams","Haas","Alfa Romeo","Alpha Tauri"]
    @State private var name = ""
    var body: some View {
        NavigationView{
            ZStack{
                Color.black.edgesIgnoringSafeArea(.all)
                
                RoundedRectangle(cornerRadius: 30, style: .continuous)
                    .foregroundStyle(.linearGradient(colors: [.red, .black], startPoint: .topLeading, endPoint: .bottomTrailing))
                    .frame(width:1000, height: 100)
                    .rotationEffect(.degrees(135))
                    .offset(y: -250)
                
                VStack{
                    AccountInfoView()
                        .frame(height: 300)
                        .environmentObject(dataManager)
                                  
                    Button{
                        
                        firebaseAuth.signOut()
                        
                        
                    } label: {
                        Text("Log Out")
                            .bold()
                            .frame(width: 200,height: 40)
                            .background(
                                RoundedRectangle(cornerRadius: 10, style: .continuous)
                                    .fill(.linearGradient(colors: [.red,.white], startPoint: .top, endPoint: .bottomTrailing ))
                            )
                            .foregroundColor(.black)
                    }
                    .padding(.top)
                    .offset(y: 100)
                }
            }
        }
    }
}


struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
        AccountView()
            
            .environmentObject(FirebaseAuthService())
            .environmentObject(DataManager())
    }
}

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
    @EnvironmentObject var dataManger: DataManager
    var body: some View {
        NavigationView{
            ZStack{
                Color.black.edgesIgnoringSafeArea(.all)
                
                RoundedRectangle(cornerRadius: 30, style: .continuous)
                    .foregroundStyle(.linearGradient(colors: [.red, .black], startPoint: .topLeading, endPoint: .bottomTrailing))
                    .frame(width:1000, height: 100)
                    .rotationEffect(.degrees(135))
                    .offset(y: -250)
                //            dataManager.addUserInfo(firebaseAuth.user.uid, name: $name, color: $color)
                VStack{
                    
                    
                    
                    
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
    }
}

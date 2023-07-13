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
            Color.white.edgesIgnoringSafeArea(.all)
            
//            dataManager.addUserInfo(firebaseAuth.user.uid, name: $name, color: color)
                
                
                
                
          
            Button{
                
                firebaseAuth.signOut()
                  
                
            } label: {
                Text("Log Out")
                    .bold()
                    .frame(width: 200,height: 40)
                    .background(
                        RoundedRectangle(cornerRadius: 10, style: .continuous)
                            .fill(.linearGradient(colors: [.red,.black], startPoint: .top, endPoint: .bottomTrailing ))
                    )
                    .foregroundColor(.white)
            }
            .padding(.top)
            .offset(y: 100)
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

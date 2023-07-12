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
                
                
                
                
            Button("Log Out"){
                firebaseAuth.signOut()
              
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

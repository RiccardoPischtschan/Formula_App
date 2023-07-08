//
//  FirebaseAuthService.swift
//  Formula App
//
//  Created by Riccardo Pischtschan on 05.07.23.
//

import Foundation
import FirebaseAuth

class FirebaseAuthService : ObservableObject{
    
    
    @Published var user : User?
     
     init(){
         listentoAuthState()
     }
     func listentoAuthState(){
         Auth.auth().addStateDidChangeListener { _, user in
             self.user = user
         }
     }
    
    func login(email: String,password: String){
        Auth.auth().signIn(withEmail: email, password: password){result,error in
            if error != nil{
                print(error!.localizedDescription)
             
            }
        }
    }
    
    func register(email: String, password: String){
        Auth.auth().createUser(withEmail: email, password: password){ result,error in
            
            if error != nil{
                print(error!.localizedDescription)
          
            }
        }
    }
  
    func signOut(){
        do{
            try Auth.auth().signOut()
        }catch{
            print(error)
        }
    }
   
}

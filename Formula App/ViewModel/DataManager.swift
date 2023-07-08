//
//  DataManager.swift
//  Formula App
//
//  Created by Riccardo Pischtschan on 06.07.23.
//

import Foundation
import Firebase

class DataManager: ObservableObject{
    
    @Published var user : UserAcc = UserAcc(name: "", color: "")
    
    init(){
        fetchUser()
    }
    
        func fetchUser(){
             
            guard let userId = Auth.auth().currentUser?.uid else {
                return
            }
            // get a reference to the database
            let db = Firestore.firestore()
    
            // Read the documents at a specific path
            let ref = db.collection("userAcc").document(userId)
                   ref.getDocument{ snapshot, error in
    
                // Check for errors
                       guard error == nil else {
                           print(error!.localizedDescription)
                           return
                       }
                    // No errors
                    if let snapshot = snapshot {
                        
                            let data = snapshot.data()
                            
                        if let data = data {
                            let name = data["name"] as? String ?? ""
                            let color = data["color"] as? String ?? ""
                            
                            let userAc = UserAcc( name: name, color: color)
                            print(userAc.name)
                            self.user = userAc
                          }
                        }
                }
            }
        }
    func addUserInfo(userInfo: String){
        let db = Firestore.firestore()
        let ref = db.collection("UserACC").document(userInfo)
        ref.setData(["name": userInfo, "color": userInfo]) { error in
            if let error = error {
                print(error.localizedDescription)
            }
        }
        
    }


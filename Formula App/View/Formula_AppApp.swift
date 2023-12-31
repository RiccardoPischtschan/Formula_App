//
//  Formula_AppApp.swift
//  Formula App
//
//  Created by Riccardo Pischtschan on 21.06.23.
//

import SwiftUI
import Firebase
import FirebaseCore
import FirebaseFirestore

@main
struct Formula_AppApp: App {
  
    init(){
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(FirebaseAuthService())
        }
    }
}

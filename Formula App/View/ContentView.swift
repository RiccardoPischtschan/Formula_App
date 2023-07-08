//
//  ContentView.swift
//  Formula App
//
//  Created by Riccardo Pischtschan on 26.06.23.
//

import SwiftUI
import FirebaseAuth

struct ContentView: View {
    @EnvironmentObject var authService: FirebaseAuthService

    var body: some View {
        if authService.user != nil {
            HomeView()
        } else {
            AuthView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(FirebaseAuthService())
    }
}


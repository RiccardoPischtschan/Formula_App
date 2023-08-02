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
    
    @State private var isLoading = true
    var body: some View {
        ZStack{
            if isLoading{
                LoadingView()
            }else {
                if authService.user != nil {
                    MainView()
                } else {
                    AuthView()
                }
            }
        }
        .onAppear{
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                isLoading = false
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(FirebaseAuthService())
    }
}


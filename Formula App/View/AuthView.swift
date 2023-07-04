//
//  AuthView.swift
//  Formula App
//
//  Created by Riccardo Pischtschan on 04.07.23.
//

import SwiftUI

struct AuthView: View {
    @State private var currentViewShowing: String = "login"  // Login or Signup
    var body: some View {
        if (currentViewShowing == "login") {
            LoginView(currentShowingView: $currentViewShowing)
                .preferredColorScheme(.light)
        } else {
            SignUpView(currentShowingView: $currentViewShowing)
                .preferredColorScheme(.dark)
                .transition(.move(edge: .bottom))
        }
    }
}

struct AuthView_Previews: PreviewProvider {
    static var previews: some View {
        AuthView()
    }
}

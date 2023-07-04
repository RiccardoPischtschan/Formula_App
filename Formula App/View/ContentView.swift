//
//  ContentView.swift
//  Formula App
//
//  Created by Riccardo Pischtschan on 26.06.23.
//

import SwiftUI

struct ContentView: View {
    @AppStorage("uid") var userID: String = ""
    var body: some View {
       
//        if userID == "" {
//            AuthView()
//        } else {
//            Text("Logged In! \nYour user id is \(userID)")
            HomeView()
//        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

